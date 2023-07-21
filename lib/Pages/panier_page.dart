import 'package:flutter/material.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({Key? key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  List<Product> _cartItems = [
    Product(
      id: 1,
      name: "Robe à fleurs",
      price: 49.99,
      image: "assets/coat.png",
    ),
    Product(
      id: 2,
      name: "Chaussures à talons",
      price: 79.99,
      image: "assets/coat.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Liste des articles du panier
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final product = _cartItems[index];
                return Dismissible(
                  key: Key(product.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      _cartItems.removeAt(index);
                    });
                  },
                  child: ListTile(
                    leading: Image.asset(
                      product.image,
                      height: 60,
                      width: 60,
                    ),
                    title: Text(product.name),
                    subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                  ),
                );
              },
            ),
            // Total du panier
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Total: \$${_calculateTotalAmount().toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Bouton "Valider ma commande"
            ElevatedButton(
              onPressed: () {
                //  ici le code pour valider la commande
              },
              child: Text("Valider ma commande"),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTotalAmount() {
    return _cartItems.fold(0.0, (sum, item) => sum + item.price);
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}
