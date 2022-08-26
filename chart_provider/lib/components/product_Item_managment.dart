import 'package:chart_provider/models/Product.dart';
import 'package:flutter/material.dart';

class ProdutItemManagment extends StatelessWidget {
  final Product product;
  const ProdutItemManagment({Key? key, required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircleAvatar(
              child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            scale: 0.5,
          )),
        ],
      ),
    );
  }
}

/*
leading: CircleAvatar(
            child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        )),
        title: Text(product.name),
        */
