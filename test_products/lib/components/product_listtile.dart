import 'package:flutter/material.dart';
import 'package:test_products/models/product.dart';

class ProductListSlite extends StatelessWidget {
  const ProductListSlite({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("Id: ${product.id}"),
      title: Text(" ${product.name}"),
      trailing: Text(
        product.price.toStringAsFixed(2),
      ),
    );
  }
}
