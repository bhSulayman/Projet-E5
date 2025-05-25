import 'package:flutter/material.dart';

class PanierPage extends StatelessWidget {
  const PanierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
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
      body: const Center(
        child: Text(
          'Votre panier est vide.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
