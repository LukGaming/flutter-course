import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_crud/models/product.dart';
import 'package:product_crud/services/product_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> _products = [];
  @override
  void initState() {
    ProductService.getProducts().then((value) {
      print('Value: ${value}');
      setState(() {
        _products = value;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Crud"),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => Row(
          children: [
            Row(
              children: [
                Text(_products[index].name),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
