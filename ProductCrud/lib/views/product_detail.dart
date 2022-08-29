import 'package:flutter/material.dart';
import 'package:product_crud/models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product detail"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.blue,
              ),
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(5),
            child: Text(
              product.description,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$ ${product.price}',
                  style: textStyle,
                ),
                Text(
                  "Categoria: Processadores",
                  style: textStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
