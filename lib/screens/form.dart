import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:pbp_flutter/screens/home.dart';
import 'package:pbp_flutter/widget/left_drawer.dart';
import 'package:provider/provider.dart';

class GameForm extends StatefulWidget {
  final int id;
    const GameForm({super.key,required this.id});

    @override
    State<GameForm> createState() => _GameForm();
}

class _GameForm extends State<GameForm> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    String _description = "";
    int _amount = 0;

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        final int id = widget.id;
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
            drawer:  LeftDrawer(id :id),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Jumlah Game",
                            labelText: "Jumlah Game",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                            _amount = int.parse(value!);
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Jumlah Game tidak boleh kosong!";
                            }
                            if (int.tryParse(value) == null) {
                              return "Jumlah Game harus berupa angka!";
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