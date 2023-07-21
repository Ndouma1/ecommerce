import 'package:ecommerce/Pages/panier_page.dart';
import 'package:ecommerce/Pages/product_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'homme'; // Catégorie actuellement sélectionnée

  void _changeCategory() {
    setState(() {
      selectedCategory = (selectedCategory == 'homme') ? 'femme' : 'homme';
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Utiliser le GlobalKey ici
      appBar: AppBar(
        backgroundColor: Colors.white54,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: _openDrawer,
        ),
        title: GestureDetector(
          onTap: _changeCategory,
          child: Row(
            children: [
              Icon(
                Icons.arrow_drop_down,
                color: Colors.black12,
              ),
              Text(
                selectedCategory,
                style: TextStyle(
                  color: (selectedCategory == 'homme')
                      ? Colors.black12
                      : Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.black,
            onPressed: () {
              // Mettez ici le code pour accéder aux articles favoris
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              //  ici le code pour ouvrir l'écran de recherche
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Nom de la personne connectée"),
              accountEmail: Text("Coucou"),
              currentAccountPicture: CircleAvatar(
                // ici l'image du profil de l'utilisateur connecté
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                //  ici le code pour l'accueil
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Panier'),
              onTap: () {
                //  ici le code pour le panier
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PanierPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Articles préférés'),
              onTap: () {
                //  ici le code pour les articles préférés
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Mon compte'),
              onTap: () {
                // ici le code pour le compte de l'utilisateur
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Réglages'),
              onTap: () {
                // ici le code pour les réglages
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Aide et FAQ'),
              onTap: () {
                // ici le code pour l'aide et les questions fréquentes
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Déconnexion'),
              onTap: () {
                // ici le code pour la déconnexion de l'utilisateur
              },
            ),
          ],
        ),
      ),
      // Contenu de la page d'accueil
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  // ici le code pour la redirection vers la catégorie des soldes
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Soldes été sont la êtes vous pret pour un mois de shopping!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '-80%',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //  ici le code pour la redirection vers la catégorie représentée
                },
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/shopping.png',
                        height: 80,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nos nouveautées',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text(
                "Ce qui peut vous intéressez !!! ",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      //  ici le code pour rediriger vers la première page
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/man.png',
                            height: 80,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nos plus belles pairs ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //  ici le code pour rediriger vers la deuxième page
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/jeans.png',
                            height: 80,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Pour toutes les occasions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // ici le code pour rediriger vers la troisième page
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/coat.png',
                            height: 80,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nos vestes pour d hiver et plus ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //  ici le code pour rediriger vers la quatrième page
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/gift.png',
                            height: 80,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Vos articles préferés sont ici',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: Text(
                  "Abonne-toi à NDOUMA-SHOP Premier France pour profiter de la Livraison 24h les jours ouvrés pendant toute une année et en illimité dès 20 € d'achat (et de la livraison standard gratuite sur toutes les autres commandes !) Tu pourras aussi bénéficier de réductions exclusives comme « Premier Party » et de 3 mois d'abonnement gratuits à Spotify Premium.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/gift.png',
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Style de la saison pour plus de fun",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
