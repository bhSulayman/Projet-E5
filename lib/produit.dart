import 'package:flutter/material.dart';
import 'detail_produit.dart';

class ProduitPage extends StatelessWidget {
  const ProduitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produits"),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Découvrez notre collection exclusive de sneakers MIXTE, des classiques intemporels aux dernières nouveautés.\nTrouvez la paire parfaite pour compléter votre style.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            buildProductGrid(context, [
              productDataNetwork('https://www.offsneakz.fr/cdn/shop/files/nike-sb-dunk-low-concepts-orange-lobster-modele.webp?v=1715794445&width=1445', 'Produit 1', '€99.99'),
              productDataNetwork('https://down-tw.img.susercontent.com/file/tw-11134207-7r98z-lmhf5kjoa65777', 'Produit 2', '€89.99'),
              productDataNetwork('https://i8.amplience.net/i/jpl/jd_660316_a?qlt=92&w=600&h=425&v=1&fmt=auto', 'Produit 3', '€79.99'),
              productDataNetwork('https://tse3.mm.bing.net/th?id=OIP._cwFh1oO0b_pT8IgyKA-NwAAAA&pid=Api', 'Produit 4', '€109.99'),
            ]),
            buildProductGrid(context, [
              productDataNetwork('https://photos6.spartoo.com/photos/296/29640524/29640524_500_A.jpg', 'Produit 1', '€99.99'),
              productDataNetwork('https://tse2.mm.bing.net/th?id=OIP.KC2LhoPn_KBYBulXwWgYQAHaHa&pid=Api', 'Produit 2', '€89.99'),
              productDataNetwork('https://tse2.mm.bing.net/th?id=OIP.zbnTiBtxIIPLCNPRTQ-GYQHaHa&pid=Api', 'Produit 3', '€79.99'),
              productDataNetwork('https://tse3.mm.bing.net/th?id=OIP.5X0oJVb2b_ifASV-usfwCQHaHa&pid=Api', 'Produit 4', '€109.99'),
            ]),
            buildProductGrid(context, [
              productDataNetwork('https://th.bing.com/th/id/OIP.XovIo0TZbY5oUHYNBs9iSgHaHa?w=1080&h=1080&rs=1&pid=ImgDetMain', 'Produit 1', '€99.99'),
              productDataNetwork('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSbT87ejTHRmxdXWlmN4dezA8w1o0lnZ9ADc45QaFiXTd6SFiw5', 'Produit 2', '€89.99'),
              productDataNetwork('https://th.bing.com/th/id/OIP.KyY6ceMLlQs-_G0GKIvFrwHaHa?w=1069&h=1069&rs=1&pid=ImgDetMain', 'Produit 3', '€79.99'),
              productDataNetwork('https://photos6.spartoo.com/photos/284/28408261/28408261_500_A.jpg', 'Produit 4', '€109.99'),
            ]),
            buildProductGrid(context, [
              productDataNetwork('https://i.ebayimg.com/images/g/2QUAAOSwEAlk6HyR/s-l1200.jpg', 'Produit 1', '€99.99'),
              productDataNetwork('https://i.pinimg.com/736x/8f/68/6c/8f686c982243a7e8093889373d7d8fcc.jpg', 'Produit 2', '€89.99'),
              productDataNetwork('https://photos6.spartoo.com/photos/289/28937715/28937715_350_A.jpg', 'Produit 3', '€79.99'),
              productDataNetwork('https://tse2.mm.bing.net/th?id=OIP.WjMwd5xHlMddKgRVuLQiBgHaHa&pid=Api', 'Produit 4', '€109.99'),
            ]),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Ajout de context ici
  Widget productCardWithButton(
    BuildContext context,
    String imagePath,
    String title,
    String description,
    String price,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Image.asset(imagePath, height: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(description, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text(price, style: const TextStyle(color: Colors.green)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProduit(
                            image: imagePath,
                            titre: title,
                            description: description,
                            prix: price,
                          ),
                        ),
                      );
                    },
                    child: const Text('En savoir plus'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> productDataNetwork(String url, String name, String price) {
    return {
      'image': url,
      'name': name,
      'price': price,
      'isNetwork': true,
    };
  }

  Widget buildProductGrid(BuildContext context, List<Map<String, dynamic>> products) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
        children: products.map((prod) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProduit(
                    image: prod['image'],
                    titre: prod['name'],
                    description: 'Description rapide du produit.',
                    prix: prod['price'],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(prod['image'], fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(prod['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(prod['price'], style: const TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
