import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produits"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("products").get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Erreur lors du chargement des données"),
              );
            } else {
              List<Product> products = snapshot.data!.docs
                  .map((doc) => Product.fromSnapshot(doc))
                  .toList();
              return Column(
                children: products
                    .map((product) => ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            child: Image.network(
                              product.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(product.name),
                          subtitle:
                              Text("\$${product.price.toStringAsFixed(2)}"),
                        ))
                    .toList(),
              );
            }
          },
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String
      imagePath; // Use imagePath instead of creating a new field named image
  final double price;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
  });

  // Constructeur pour créer un objet Product à partir d'un DocumentSnapshot de Firestore
  Product.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get("Name"),
        imagePath = snapshot.get("images"),
        price = double.tryParse(snapshot.get("price") ?? "0.0") ?? 0.0;
}
