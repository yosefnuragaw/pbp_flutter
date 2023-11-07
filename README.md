# GAME STOCK

Nama    : Yosef Nuraga Wicaksana
NPM     : 2206082751
Kelas   : PBP C

## Link
* [Tugas 1](#tugas-1)

### Tugas 1
1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
* Stateless Widget
Stateless     : Tidak ada perubahan keadaan internal yang dapat terjadi sehingga hanya menggambarkan tampilan berdasarkan propertinya.
Immutability  : Stateless widget yang propertinya tidak dapat diubah.

* Stateful Widget
Stateful  : Widget dapat menyimpan keadaan internal yang dapat berubah berdasarkan perubahan keadaan.
Mutable:  : Stateful widget dapat memperbarui keadaan internalnya selama widget termasuk dalam tree widget.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
* MyApp (Stateless)
Sebuah widget root dari aplikasi flutter yang menampilkan widget lainnya

* MyHomePage (Stateless)
Sebuah widget homepage sebagai wadah untuk widget tiga button lainnya yang diletakkan dalam MyApp

* GameCard (Stateless)
Sebuah widget untuk membentuk button dengan warnanya masing - masing sesuai dengan inisialisasi dalam GameItem

3. Langkah Tugas 1
- Bentuk Folder flutter
- Tautkan dengan repository github
- Membuat file `home.dart` sebagai tempat untuk widget homepage
- isi file `home.dart` Game Item sebagai informasi widget Button GameItem
```dart
class GameItem {
  final String name;
  final IconData icon;
  final Color color;

  GameItem(this.name, this.icon, this.color);
}
```
- Definisikan sebuah widget untuk membentuk tiap button GameItem
```dart
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
```
- Modifikasi widget homepage untuk menampilkan tiap card
```dart
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
```
- Modifikasi `main.dart` untuk menjadi
```dart
import 'package:flutter/material.dart';
import 'package:pbp_flutter/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}
```