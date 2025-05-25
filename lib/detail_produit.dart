import 'package:flutter/material.dart';

class DetailProduit extends StatefulWidget {
  final String image;
  final String titre;
  final String description;
  final String prix;

  const DetailProduit({
    super.key,
    required this.image,
    required this.titre,
    required this.description,
    required this.prix,
  });

  @override
  State<DetailProduit> createState() => _DetailProduitState();
}

class _DetailProduitState extends State<DetailProduit> {
  String? selectedSize;

  final List<String> tailles = ['36', '37', '38', '39', '40', '41', '42', '43', '44'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titre)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(widget.image, height: 250, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(widget.titre, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(widget.description, textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text(widget.prix, style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 20),
            const Text('Choisissez une taille', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: tailles.map((taille) {
                return ChoiceChip(
                  label: Text(taille),
                  selected: selectedSize == taille,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedSize = selected ? taille : null;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: selectedSize == null
                  ? null
                  : () {
                      // Logique d'ajout au panier ici
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Ajouté au panier - Taille $selectedSize')),
                      );
                    },
              child: const Text('Ajouter au panier'),
            ),
          ],
        ),
      ),
    );
  }
}
