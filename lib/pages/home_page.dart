import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyBAPS App", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ?
            // ? ListView.builder(
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatalogModel.items[index],
            //       );
            //     },
            //     itemCount: CatalogModel.items.length,
            //   )
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          decoration:
                              const BoxDecoration(color: Colors.deepPurple),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        child: Image.network(
                          item.image,
                          fit: BoxFit.cover,
                        ),
                        footer: Container(
                            decoration:
                                const BoxDecoration(color: Colors.black),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              item.price.toString(),
                              style: const TextStyle(color: Colors.white),
                            )),
                      ));
                },
                itemCount: CatalogModel.items.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const Mydrawer(),
    );
  }
}
