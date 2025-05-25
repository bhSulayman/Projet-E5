const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const bcrypt = require('bcryptjs');

const app = express();
const port = 3000;

// Middleware pour parser le body des requêtes en JSON
app.use(bodyParser.json());

// Configuration de la connexion à MySQL
const db = mysql.createConnection({
  host: '10.50.0.44',
  user: 'sulayman',
  password: 'Pas-de-mdp22',
  database: 'sneakverse',
  connectTimeout: 10000,
});

db.connect((err) => {
  if (err) {
    console.error('Erreur de connexion à MySQL:', err);
    return;
  }
  console.log('Connecté à la base de données MySQL');
  console.log(`CTRL + Click sur : http://10.50.0.44/phpmyadmin`);
});

// Route pour inscrire un utilisateur
app.post('/demande', async (req, res) => {
  console.log("test2");
  const { email, password, nom, prenom } = req.body;

  if (!email || !password || !nom || !prenom) {
    return res.status(400).json({ message: 'Tous les champs sont requis' });
  }

  try {
    const hashedPassword = await bcrypt.hash(password, 10);

    const sql = 'INSERT INTO utilisateurs (email, password, nom, prenom) VALUES (?, ?, ?, ?)';
    db.query(sql, [email, hashedPassword, nom, prenom], (err, result) => {
      if (err) {
        if (err.code === 'ER_DUP_ENTRY') {
          return res.status(409).json({ message: 'Email déjà utilisé' });
        }
        console.error('Erreur d\'insertion:', err);
        return res.status(500).json({ message: 'Erreur lors de l\'inscription' });
      }

      res.status(200).json({
        message: 'Utilisateur inscrit avec succès',
        id: result.insertId,
        email,
        nom,
        prenom,
      });
    });
  } catch (err) {
    console.error('Erreur de hashage:', err);
    res.status(500).json({ message: 'Erreur serveur' });
  }
});

// Route de connexion (POST, pas GET)
app.post('/connexion', (req, res) => {
  console.log("test");
  const { email, password } = req.body; // <- avec req.query, pas req.body
  console.log(email, password);

  if (!email || !password) {
    return res.status(400).json({ message: 'Champs requis manquants' });
  }

  const sql = 'SELECT * FROM utilisateurs WHERE email = ?';
  db.query(sql, [email], (err, results) => {
    if (err) {
      console.error('Erreur SQL:', err);
      return res.status(500).json({ message: 'Erreur de la base de données' });
    }

    if (results.length === 0) {
      return res.status(401).json({ message: 'Email ou mot de passe incorrect' });
    }

    const utilisateur = results[0];

    bcrypt.compare(password, utilisateur.password, (err, isMatch) => {
      if (err) {
        console.error('Erreur bcrypt:', err);
        return res.status(500).json({ message: 'Erreur interne' });
      }

      if (!isMatch) {
        return res.status(401).json({ message: 'Email ou mot de passe incorrect' });
      }

      res.status(200).json({
        message: 'Connexion réussie',
        utilisateur: {
          id: utilisateur.id,
          email: utilisateur.email,
          nom: utilisateur.nom,
          prenom: utilisateur.prenom,
        },
      });
    });
  });
  console.log(email, password);
});



// Lancer le serveur
app.listen(port, () => {
  console.log(`Serveur API en écoute sur http://localhost:${port}`);
});
