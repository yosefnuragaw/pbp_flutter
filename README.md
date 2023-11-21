# GAME STOCK

Nama    : Yosef Nuraga Wicaksana
NPM     : 2206082751
Kelas   : PBP C

## Link
* [Tugas 7](#tugas-7) <br>
* [Tugas 8](#tugas-8) <br>

# Tugas 1
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

# Tugas 8
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


# Tugas 9
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Pengambilan data JSON tanpa pendefinisian model terlebih dahulu memungkinkan deserialization langsung, di mana data JSON dikonversi menjadi objek tanpa adanya model yang telah ditentukan sebelumnya. Namun, kekurangan dari pendekatan ini adalah bahwa data cenderung kurang terstruktur. Tanpa menggunakan model kita kurang bisa mendefinisikan struktur data dengan jelas, sehingga mempersulit pemahaman dan dokumentasi kode. Selain itu, model memanfaatkan sistem tipe Dart, yang memberikan kejelasan tipe data selama pengembangan dan membantu mencegah kesalahan tipe, sehingga jika kita tidak menggunakan model, kita tidak dapat memanfaatkan hal tersebut. Oleh karena itu, membuat model menjadi pilihan yang lebih baik karena memungkinkan untuk mendefinisikan struktur data dengan jelas, sehingga memudahkan pengelolaan data secara efektif.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah suatu objek yang terkait dengan permintaan HTTP dan berfungsi sebagai penyimpan informasi cookie. Penggunaannya umum dalam Flutter untuk menyimpan atau mengelola cookie yang diperlukan untuk keperluan otorisasi atau autentikasi. Dengan membagikan instance CookieRequest ke semua komponen di aplikasi Flutter, hal ini bertujuan untuk memastikan konsistensi dalam penggunaan cookie di seluruh aplikasi. Dengan demikian, setiap komponen dapat mengakses atau memproses cookie yang benar dan diperlukan dengan cara yang sesuai.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Melakukan HTTP *request* ke *endpoint* yang menyediakan data dalam format JSON. Buat folder dan file baru di /lib/models/.dart dan isi sesuai dengan format json yang akan diterima melalui konversi di [Quicktype](https://app.quicktype.io/).
2. Melakukan parsing respons JSON ke dalam struktur data yang dapat digunakan dalam aplikasi Flutter. Contoh kode:
    ```dart
   // To parse this JSON data, do
//
//     final game = gameFromJson(jsonString);

import 'dart:convert';

List<Product> gameFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String gameToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int amount;
    DateTime dateAdded;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.amount,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        amount: json["amount"],
        dateAdded: DateTime.parse(json["date_added"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "amount": amount,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    };
}
    ```
3. Menampilkan data sesuai keinginan.

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Menggunakan package `provider` dan `pbp_django_auth` untuk integrasi autentikasi dari Django.
2. Mengirim data autentikasi ke Django, jika valid maka akan redirect ke home page di app Flutter
    ```dart
     onPressed: () async {
        String username = _usernameController.text;
        String password = _passwordController.text;

        // Cek kredensial
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        // Untuk menyambungkan Android emulator dengan Django pada localhost,
        // gunakan URL http://10.0.2.2/
        final response =
            await request.login("https://yosef-nuraga-tugas.pbp.cs.ui.ac.id./auth/login/", {
            'username': username,
            'password': password,
        });

        if (request.loggedIn) {
            String message = response['message'];
            String uname = response['username'];
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
            );
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("$message Selamat datang, $uname.")));
        } else {
            showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text('Login Gagal'),
                content: Text(response['message']),
                actions: [
                TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                    Navigator.pop(context);
                    },
                ),
                ],
            ),
            );
        }
    },
    ```

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
- ElevatedButton: Sebuah tombol ditinggikan yang berfungsi untuk menyimpan data item setelah diisi melalui formulir.
- TextFormField: Widget input teks yang memungkinkan pengguna memasukkan informasi seperti nama item, jumlah, harga, dan deskripsi.
- GridView.count: Menampilkan daftar item dalam tata letak grid dengan jumlah kolom yang dapat diatur.
- Navigator: Bertanggung jawab atas navigasi antar halaman dalam aplikasi Flutter.
- Column: Mengorganisir widget secara vertikal, berguna untuk menyusun dan menata elemen-elemen tampilan.
- MaterialApp: Widget root yang menentukan tema dan halaman awal aplikasi Flutter.
- SnackBar: Notifikasi yang muncul setelah berhasil menyimpan item atau jika terjadi kesalahan.
- Icon: Menampilkan ikon yang mewakili setiap item.
- ShopCard: Widget kustom untuk menampilkan setiap item dalam format card.
- Text: Menampilkan teks seperti nama item untuk memberikan informasi kepada pengguna.
- Drawer: Menyediakan daftar opsi menu untuk navigasi.
- InkWell: Widget responsif terhadap sentuhan pengguna, digunakan untuk menanggapi interaksi seperti tap pada ShopCard.
- Provider: Digunakan untuk menyediakan instance CookieRequest ke seluruh aplikasi.
- Form: Menyediakan kerangka untuk membuat formulir input data item.
- Material: Mengatur warna latar belakang item di dalam grid.
- ListView: Menampilkan daftar opsi menu dalam drawer untuk navigasi.
- FutureBuilder: Mengelola tampilan berdasarkan status future untuk mendapatkan dan menampilkan data item secara asinkronus.
- Scaffold: Menyusun dasar aplikasi dengan AppBar, Drawer, dan body.
- ListTile: Membuat opsi menu dalam drawer dengan tampilan konsisten dan mudah diakses.
- GridView.builder: Menampilkan daftar item dalam bentuk grid yang dapat di-scroll.

## Integrasi Autentikasi Django-Flutter
### Setup Autentikasi pada Django untuk Flutter
1. Buatlah `django-app` bernama `authentication` pada project Django yang bersesuaian dengan projek flutter ini
2. Tambahkan `authentication` ke `INSTALLED_APPS` pada `main` project `settings.py` aplikasi Django.
3. Tambahkan `django-cors-headers` pada `requirements.txt` dan jalankan perintah` pip install -r requirements.txt`.
4. Tambahkan `corsheaders` dan `authentication` ke `INSTALLED_APPS` pada `main` project `settings.py` aplikasi Django.
5. Tambahkan `corsheaders.middleware.CorsMiddleware `pada `main` project `settings.py` aplikasi Django.
6. Tambahkan beberapa variabel berikut ini pada `main` project `settings.py` aplikasi Django.
    ```python
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
7. Buatlah  metode view untuk login pada `authentication/views.py`.
    ```python
    from django.shortcuts import render
    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
    ```
8. Buat file `urls.py` pada folder `authentication` dan tambahkan URL routing terhadap fungsi yang sudah dibuat.
    ```python
    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
    ]
    ```
9. Tambahkan path('auth/', include('authentication.urls')), pada file `<PROJECT_NAME>/urls.py` (sesuaikan PROJECT_NAME dengan nama project Django yang bersesuaian).

### Integrasi Sistem Autentikasi pada Flutter
1. Install package pada flutter app kita dengan menjalankan perinta ini di terminal
    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    ```
2. Modifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan `Provider`.
    ```dart
    // Import kedua ini
    import 'package:provider/provider.dart'; 
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    ...
    
    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider( //TAMBAHKAN INI
        create: (_) {
            CookieRequest request = CookieRequest();
            return request;
        }, 
        child: MaterialApp(
            title: 'Flutter App',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
            ),
            home: MyHomePage()),
        );
    }
    }
    ```
3. Buat file baru pada folder `screens` dengan nama `login.dart`, isi file dengan kode berikut.
    
    ```dart
    import 'package:shopping_list/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
                appBar: AppBar(
                    title: const Text('Login'),
                ),
                body: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                    labelText: 'Username',
                                ),
                            ),
                            const SizedBox(height: 12.0),
                            TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                ),
                                obscureText: true,
                            ),
                            const SizedBox(height: 24.0),
                            ElevatedButton(
                                onPressed: () async {
                                    String username = _usernameController.text;
                                    String password = _passwordController.text;

                                    // Cek kredensial
                                    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                    // gunakan URL http://10.0.2.2/
                                    final response = await request.login("http://<APP_URL_KAMU>/auth/login/", {
                                    'username': username,
                                    'password': password,
                                    });
                        
                                    if (request.loggedIn) {
                                        String message = response['message'];
                                        String uname = response['username'];
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                        );
                                        ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(
                                                SnackBar(content: Text("$message Selamat datang, $uname.")));
                                        } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                title: const Text('Login Gagal'),
                                                content:
                                                    Text(response['message']),
                                                actions: [
                                                    TextButton(
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                            Navigator.pop(context);
                                                        },
                                                    ),
                                                ],
                                            ),
                                        );
                                    }
                                },
                                child: const Text('Login'),
                            ),
                        ],
                    ),
                ),
            );
        }
    }
    ```
4. Pada file `main.dart`, pada `Widget MaterialApp(...)`, ubah home: `MyHomePage()` menjadi home: `LoginPage()`. Setelah itu coba jalankan app Flutter dan coba *log in*.
    ```dart
    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
        create: (_) {
            CookieRequest request = CookieRequest();
            return request;
        },
        child: MaterialApp(
            title: 'Flutter App',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
            ),
            home: LoginPage()), 
        );
    }
    }
    ```

## Pembuatan Model Kustom
1. Bukalah endpoint `JSON` yang sudah dibuat sebelumnya pada tutorial 2.
2. Salinlah data `JSON` dan buka situs web [Quicktype](https://app.quicktype.io/).
3. Pada situs web [Quicktype](https://app.quicktype.io/), ubahlah setup name menjadi `Item` (sesuaikan dengan nama model di `Django App`), source type menjadi `JSON`, dan language menjadi `Dart`.
4. Tempel data `JSON` yang telah disalin sebelumnya ke dalam *textbox* yang tersedia pada [Quicktype](https://app.quicktype.io/).
5. Klik pilihan `Copy Code` pada `Quicktype`.
6. Setelah mendapatkan kode model melalui [Quicktype](https://app.quicktype.io/), buka kembali proyek Flutter, buatlah file baru pada folder `lib/models` dengan nama `item.dart`, dan tempel kode yang sudah disalin dari [Quicktype](https://app.quicktype.io/). Berikut adalah contoh kode:
    ```dart
    // To parse this JSON data, do
//
//     final game = gameFromJson(jsonString);

import 'dart:convert';

List<Product> gameFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String gameToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int amount;
    DateTime dateAdded;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.amount,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        amount: json["amount"],
        dateAdded: DateTime.parse(json["date_added"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "amount": amount,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    };
}
    ```

## Penerapan Fetch Data dari Django Untuk Ditampilkan ke Flutter
### Menambahkan Dependensi HTTP
1. Lakukan `flutter pub add http` pada terminal proyek Flutter untuk menambahkan package `http`.
2. Pada file `android/app/src/main/AndroidManifest.xml`, tambahkan kode berikut untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat.
    ```xml
    ...
        <application>
        ...
        </application>
        <!-- Required to fetch data from the Internet. -->
        <uses-permission android:name="android.permission.INTERNET" />
    ...
    ```

### Melakukan Fetch Data dari Django
1. Buatlah file baru pada folder `lib/screens` dengan nama `list_item.dart`.
2. Pada file `list_item.dart`, impor *library* yang dibutuhkan. 
    ```dart
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:soundwave/models/product.dart';
    ...
    ```
3. Masukkan kode berikut pada `screens/list_item.dart`.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:soundwave/models/Item.dart';
    import 'package:soundwave/widgets/left_drawer.dart';

    import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pbp_flutter/models/product.dart';
import 'package:pbp_flutter/widget/left_drawer.dart';

class ProductPage extends StatefulWidget {
  final int id;
    const ProductPage({required this.id,Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final int id = widget.id;
    var url = Uri.parse(
        'http://localhost:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json/"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null && d['fields']['user'] == id) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    final int id = widget.id;
    return Scaffold(
        appBar: AppBar(
        title: const Text('Game List'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        ),
        drawer:  LeftDrawer(id : id),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: IntrinsicWidth(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    Text("Price : ${snapshot.data![index].fields.price}",textAlign: TextAlign.center),
                                    const SizedBox(height: 5),
                                    Text("Description : ${snapshot.data![index].fields.description}",textAlign: TextAlign.center),
                                    const SizedBox(height: 5),
                                    Text("Amount : ${snapshot.data![index].fields.amount}",textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the alert
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );

                    }
                }
            }));
    }
}
    ```
4. Tambahkan halaman `list_item.dart` ke `widgets/left_drawer.dart` dengan menambahkan kode berikut.
    ```dart
    ListTile(
        leading: const Icon(Icons.shopping_basket),
        title: const Text('Daftar Album'),
        onTap: () {
            // Route menu ke halaman produk
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ItemPage()),
            );
        },
        ),
    ```
5. Ubah fungsi tombol `Lihat Album` pada halaman utama agar mengarahkan ke halaman `ItemPage` dengan menambahkan `else if` setelah kode `if(...){...}` di bagian akhir `onTap: () { }` yang ada pada file `widgets/shop_card.dart`. Impor file yang dibutuhkan saat menambahkan `ItemPage` ke `left_drawer.dart` dan `shop_card.dart`.
    ```dart
    // IMPORT FILE YANG DIBUTUHKAN
    ...
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:soundwave/screens/login.dart';
    import 'package:soundwave/screens/album_form.dart';
    import 'package:soundwave/screens/list_item.dart';
    ...
    ```

    ```dart
    // TAMBAHKAN ELSE IF INI
    else if (item.name == "Lihat Album") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ItemPage()));
    } 
    ```
6. Jalankan aplikasi dan cobalah untuk menambahkan beberapa Item di situs web dan coba lihat hasilnya di `Daftar Album`.

## Integrasi Form Flutter Dengan Layanan Django
### Lakukan pada kode proyek Django
1. Buatlah sebuah fungsi `view` baru pada `main/views.py` aplikasi Django dengan potongan kode berikut.
    ```python
  @csrf_exempt
  def create_product_flutter(request):
      if request.method == 'POST':
          
          data = json.loads(request.body)

          new_product = Product.objects.create(
              user = request.user,
              name = data["name"],
              price = int(data["price"]),
              description = data["description"],
              amount = data["amount"],
          )

          new_product.save()

          return JsonResponse({"status": "success"}, status=200)
      else:
          return JsonResponse({"status": "error"}, status=401)
    ```
2. Tambahkan path baru pada `main/urls.py` dengan kode berikut.
    ```python
    path('create-flutter/', create_product_flutter, name='create_product_flutter'),
    ```

### Lakukan pada kode proyek Flutter
1. Hubungkan halaman `album_form.dart` dengan `CookieRequest` dengan menambahkan baris kode berikut.
    ```dart
    ...
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    ...

    ...
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>(); // TAMBAHKAN INI

        return Scaffold(
        ...
    ```
2. Ubahlah perintah pada `onPressed: ()` button tambah menjadi kode berikut.
    ```dart
       onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                      // Kirim ke Django dan tunggu respons
                      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                      final response = await request.postJson(
                      "http://localhost:8000/create-flutter/",
                      jsonEncode(<String, String>{
                          'name': _name,
                          'price': _price.toString(),
                          'description': _description,
                          'amount': _amount.toString(),
                      }));
                      if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                          content: Text("Produk baru berhasil disimpan!"),
                          ));
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage(id:id)),
                          );
                      } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                              content:
                                  Text("Terdapat kesalahan, silakan coba lagi."),
                          ));
                      }
                  }
              },
    ```

## Implementasi Fitur Logout
### Lakukan pada kode proyek Django
1. Buatlah sebuah metode `view` untuk logout pada `authentication/views.py`.
    ```python
    from django.contrib.auth import logout as auth_logout
    ...
    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)
    ```
2. Tambahkan path baru pada `authentication/urls.py` dengan kode berikut.
    ```python
    path('logout/', logout, name='logout'),
    ```

### Lakukan pada kode proyek Flutter
1. Buka file `lib/widgets/shop_card.dart` dan tambahkan potongan kode berikut. Selesaikan masalah impor library setelah menambahkan potongan kode ke dalam file tersebut.
    ```dart
    ...
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Material(
        ...
    ```
2. Ubahlah perintah `onTap: () {...} `pada widget `Inkwell` menjadi `onTap: () async {...} `agar widget `Inkwell` dapat melakukan proses logout secara asinkronus.

3. Tambahkan kode berikut ke dalam `async {...}` di bagian akhir:
    ```dart
    ...
    // statement if sebelumnya
    // tambahkan else if baru seperti di bawah ini
    else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://<URL_APP_NAME>/auth/logout/");
            String message = response["message"];
            if (response['status']) {
            String uname = response["username"];
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
            ));
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
    ...
    ```