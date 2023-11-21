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