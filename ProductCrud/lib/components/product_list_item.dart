import 'package:flutter/material.dart';
import 'package:product_crud/views/product_detail.dart';

import '../models/product.dart';

class ProductlistItem extends StatelessWidget {
  final Product product;
  const ProductlistItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              product: product,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text(
                  product.price,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.purple,
                      size: 40,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 40,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}


/*
title: Text(product.name),
        leading: CircleAvatar(
          backgroundColor: Colors.purple,
          child: Text(product.price),
        ),
        trailing: Icon(Icons.delete),*/