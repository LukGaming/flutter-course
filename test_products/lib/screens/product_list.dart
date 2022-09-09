import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_products/components/product_listtile.dart';
import 'package:test_products/controllers/product_controller.dart';
import 'package:test_products/models/product.dart';
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> productList = [];
  @override
  void initState() {
    ProductController.getProducts().then((value) {
      value.forEach((element) {
        setState(() {
          productList.add(element);
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Product List"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductListSlite(product: productList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
