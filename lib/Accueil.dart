import 'package:flutter/material.dart';
import 'detail_produit.dart';


class Accueil extends StatelessWidget {
  final String title;

  const Accueil({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Accueil',
            onPressed: () {
              Navigator.pushNamed(context, '/accueil');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            tooltip: 'Produits',
            onPressed: () {
              Navigator.pushNamed(context, '/produit');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Panier',
            onPressed: () {
              Navigator.pushNamed(context, '/panier');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section image + histoire
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset('assets/images/logo1.png', height: 150),
                  const SizedBox(height: 16),
                  const Text(
                    'Bienvenue sur SneakVerse. Voici notre histoire',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '''Bienvenue dans l'univers de SneakVerse, SneakVerse est bien plus qu'une simple plateforme de vente de sneakers, c'est une communauté passionnée par le style, l'innovation et la culture urbaine. [...]''',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const Divider(),

            // Grille de produits
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75,
                children: [
                  productTileNetwork(
                    'https://www.offsneakz.fr/cdn/shop/files/nike-sb-dunk-low-concepts-orange-lobster-modele.webp?v=1715794445&width=1445',
                    'Produit 1',
                    '€99.99',
                  ),
                  productTileNetwork(
                    'https://down-tw.img.susercontent.com/file/tw-11134207-7r98z-lmhf5kjoa65777',
                    'Produit 2',
                    '€89.99',
                  ),
                  productTileNetwork(
                    'https://i8.amplience.net/i/jpl/jd_660316_a?qlt=92&w=600&h=425&v=1&fmt=auto',
                    'Produit 3',
                    '€79.99',
                  ),
                  productTileNetwork(
                    'https://tse3.mm.bing.net/th?id=OIP._cwFh1oO0b_pT8IgyKA-NwAAAA&pid=Api',
                    'Produit 4',
                    '€109.99',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bouton "Voir plus ..."
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/produit');
              },
              child: const Text('Voir plus ...'),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget productTile(String imagePath, String title, String price) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Expanded(child: Image.asset(imagePath, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Description rapide du produit.'),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productTileNetwork(String imageUrl, String title, String price) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Expanded(child: Image.network(imageUrl, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Description rapide du produit.'),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
