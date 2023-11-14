import 'package:flutter/material.dart';
import 'package:pbp_flutter/widget/left_drawer.dart';
import 'package:pbp_flutter/screens/form.dart';
import 'package:pbp_flutter/widget/home_card.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<GameItem> items = [
      GameItem("Lihat Game", Icons.checklist,const Color.fromARGB(255, 91, 181, 63)),
      GameItem("Tambah Produk", Icons.add_shopping_cart,Color.fromARGB(255, 63, 102, 181)),
      GameItem("Logout", Icons.logout,Color.fromARGB(255, 181, 63, 63)),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
        title: const Text(
          'Game Stock',
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), 
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Game Stock', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((GameItem item) {
                  // Iterasi untuk setiap item
                  return GameCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
        );
    }
}

