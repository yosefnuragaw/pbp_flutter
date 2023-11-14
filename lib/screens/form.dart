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