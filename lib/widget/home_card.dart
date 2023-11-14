import 'package:flutter/material.dart';
import 'package:pbp_flutter/widget/left_drawer.dart';
import 'package:pbp_flutter/screens/form.dart';

class GameItem {
  final String name;
  final IconData icon;
  final Color color;

  GameItem(this.name, this.icon, this.color);
}

class GameCard extends StatelessWidget {
  final GameItem item;

  const GameCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        if (item.name == "Tambah Produk") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameForm(),
                ));
        }
        },
        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}