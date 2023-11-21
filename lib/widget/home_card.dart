import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:pbp_flutter/screens/form.dart';
import 'package:pbp_flutter/screens/list_game.dart';
import 'package:pbp_flutter/screens/login.dart';
import 'package:provider/provider.dart';

class GameItem {
  final String name;
  final IconData icon;
  final Color color;

  GameItem(this.name, this.icon, this.color);
}

class GameCard extends StatelessWidget {
  final GameItem item;
  final int id;
  const GameCard(this.item,this.id, {super.key}); 

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Material(
      color: item.color,
      child: InkWell(
        onTap: () async{
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        if (item.name == "Tambah Produk") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  GameForm(id : id),
                ));
        }
        else if (item.name == "Lihat Game") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  ProductPage(id : id)));
        }
        else if (item.name == "Logout") {
        final response = await request.logout(
            "http://localhost:8000/auth/logout/");
        String message = response["message"];
        if (response['status']) {
          String uname = response["username"];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message Sampai jumpa, $uname."),
          ));
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message"),
          ));
        }
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