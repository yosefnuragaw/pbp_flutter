# GAME STOCK

Nama    : Yosef Nuraga Wicaksana
NPM     : 2206082751
Kelas   : PBP C

## Link
* [Tugas 7](#tugas-7)
* [Tugas 8](#tugas-8)

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

### Tugas 8
1. Perbedaan kedua method adalah `Navigator.push()` akan menambahkan route baru diatas route yang sudah ada pada atas stack, sedangkan `Navigator.pushReplacement()` menambahkan route baru di stack navigasi dan menghapus route sebelumnya.
-  Navigator.push()
```dart
Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const GameForm(),
    ),
);
```
-Navigator.pushReplacement()
 ```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  ),
);
```

2. 
### Column dan Row 
Kolom dan Baris berperan dalam menyusun elemen-elemen secara vertikal (Kolom) atau horizontal (Baris). Keduanya sangat berguna untuk menyusun tata letak linear, seperti formulir atau menu.

### Container
Container adalah elemen serbaguna yang berfungsi untuk mengatur gaya, padding, margin, dan pembatasan. Ini membantu dalam membuat kotak dengan warna khusus, ukuran tertentu, atau ornamen tambahan.


### Stack
Stack digunakan untuk menumpuk widget satu di atas widget lainnya, efektif untuk overlay, seperti menempatkan teks di atas gambar.
### ListView
ListView memungkinkan penampilan daftar item yang dapat di-scroll, sangat praktis untuk menampilkan daftar panjang atau konten yang tak terbatas.

### Padding
Padding ditambahkan ke sekitar widget untuk memberikan ruang tambahan di sekitarnya, menciptakan jarak atau batas antara widget dan elemen-elemen lain.

### Align dan Center
Align dan Center mengendalikan posisi widget dalam wadah. Penyelarasan digunakan untuk penempatan yang spesifik, sedangkan Pusat digunakan untuk menempatkan widget di tengah-tengah wadah.

3. 
Pada `form.dart`, beberapa elemen input pada form yang digunakan untuk memasukkan data item adalah Nama, Harga, dan Deskripsi. Pada field Nama dan Deskripsi terdapat validasi untuk masing-masing input tidak kosong valuenya sedangkan untuk Harga terdapat validasi untuk value tidak boleh kosong dan harus berupa angka.

`TextFormField` dirancang untuk digunakan dalam widget Form agar mempermudah pengelolaan data form, validasi, dan penggunaan `FormKey` untuk mengendalikan perilaku form. Elemen input ini sangat membantu dalam mengelola status dari input pengguna dengan memanfaatkan `setState` dalam `onChanged`, sehingga memberikan kendali yang baik terhadap nilai yang dimasukkan oleh pengguna. `TextFormField` juga memberikan kontrol yang lebih baik dalam proses pengeditan teks, termasuk focus node, konfigurasi controller, dan fleksibilitas dalam penanganan input teks.

4. 
Clean Architecture merupakan suatu kerangka desain perangkat lunak yang menekankan pada pemisahan konsep dan tanggung jawab dalam suatu aplikasi. Prinsip utama dalam Clean Architecture adalah "Dependency Rule," di mana ketergantungan antar modul harus mengarah ke dalam. Dalam implementasinya pada aplikasi Flutter, proyek biasanya dibagi menjadi beberapa lapisan.

- Lapisan Fitur (Feature Layer) merupakan bagian presentasi yang paling tergantung pada framework Flutter. Di sini terdapat widget untuk menampilkan antarmuka pengguna (UI), manajemen state (seperti BLoCs, Provider, GetX), dan halaman-halaman aplikasi. Struktur proyek di dalam lapisan ini melibatkan halaman, kontroler, dan widget.

- Lapisan Domain (Domain Layer) adalah lapisan terdalam yang tidak memiliki ketergantungan dengan lapisan lainnya. Lapisan ini berisi aturan bisnis aplikasi tanpa terikat pada detail implementasi. Contoh struktur proyek di dalam lapisan ini mencakup entitas, use cases, dan repositori.

- Lapisan Data (Data Layer) mewakili lapisan data aplikasi. Di dalamnya terdapat implementasi repositori, model DTO (Data Transfer Object), sumber data, dan pemetaan untuk konversi antara entitas dan model DTO. Struktur proyek di dalam lapisan ini mencakup model DTO, sumber data, dan repositori.

- Sumber Daya dan Pustaka Bersama (Resources and Shared Library) merupakan lapisan yang dapat diakses oleh semua lapisan lainnya. Lapisan ini berisi aset seperti gambar, font, dan warna (Resources), serta komponen dan fungsionalitas bersama yang dapat digunakan (Shared Library).

Dengan Clean Architecture, aplikasi dapat dikembangkan dengan lebih mudah dan terorganisir karena aturan bisnis berada di lapisan domain, implementasi repositori di lapisan data, dan presentasi di lapisan fitur.

5.  Langkah - langkah
- Buat left_drawer.dart lalu isi dengan code berikut:
```dart
import 'package:flutter/material.dart';
import 'package:pbp_flutter/screens/home.dart';
import 'package:pbp_flutter/screens/form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

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
                  builder: (context) => MyHomePage(),
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
                  builder: (context) => const GameForm(),

                ));
          },
          ),
        ],
      ),
    );
  }
}
```
- Buat `form.dart` dan isi dengan code berikut
```dart
import 'package:flutter/material.dart';
import 'package:pbp_flutter/widget/left_drawer.dart';

class GameForm extends StatefulWidget {
    const GameForm({super.key});

    @override
    State<GameForm> createState() => _GameForm();
}

class _GameForm extends State<GameForm> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Form Tambah Produk',
                ),
              ),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nama Game",
                            labelText: "Nama Game",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _name = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Nama Game tidak boleh kosong!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Harga Game",
                            labelText: "Harga Game",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                            _price = int.parse(value!);
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Harga Game tidak boleh kosong!";
                            }
                            if (int.tryParse(value) == null) {
                              return "Harga Game harus berupa angka!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Deskripsi Game",
                            labelText: "Deskripsi Game",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _description = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Deskripsi Game tidak boleh kosong!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.indigo),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Game berhasil tersimpan'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text('Nama Game: $_name'),
                          Text('Harga Game: $_price'),
                          Text('Deksripsi: $_description'),
                          
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            }
            _formKey.currentState!.reset();
          },
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
        );
    }
}
```
- Tambahkan potongan kode berikut di `home.dart` untuk menampilkan drawer
```dart
drawer: const LeftDrawer(),
```
- Tmbahkan if condition pada `home.dart` untuk navigate ke form
```dart
if (item.name == "Tambah Produk") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameForm(),
                ));
        }
```

- Refactor file untuk memisahkan widget dan screens
