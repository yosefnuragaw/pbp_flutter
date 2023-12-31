import 'package:flutter/material.dart';
import 'package:pbp_flutter/screens/home.dart';
import 'package:pbp_flutter/screens/form.dart';
import 'package:pbp_flutter/screens/list_game.dart';

class LeftDrawer extends StatelessWidget {
  final int id;
  const LeftDrawer({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Game Stock',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Insert Your new Game!",
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white, 
                        fontWeight: FontWeight.normal, 
                    ),
                )
              ],
            ),
          ),
          ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Halaman Utama'),
          // Bagian redirection ke MyHomePage
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(id : id),
                ));
          },
          ),
          ListTile(
          leading: const Icon(Icons.add_shopping_cart),
          title: const Text('Tambah Game'),
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameForm(id : id),

                ));
          },
          ),
          ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('Daftar Produk'),
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProductPage(id : id)),
                  );
              },
          ),
        ],
      ),
    );
  }
}