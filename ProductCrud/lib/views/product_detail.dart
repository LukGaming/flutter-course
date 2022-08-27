import 'package:flutter/material.dart';
import 'package:product_crud/models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product detail"),
      ),
      body: Text(product.name),
    );
  }
}
