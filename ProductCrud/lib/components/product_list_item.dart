import 'package:flutter/material.dart';
import 'package:product_crud/services/product_service.dart';
import 'package:product_crud/views/product_crud.dart';
import 'package:product_crud/views/product_detail.dart';

import '../models/product.dart';

class ProductlistItem extends StatelessWidget {
  final Product product;
  Function removeProduct;
  ProductlistItem(
      {Key? key, required this.product, required this.removeProduct})
      : super(key: key);
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
                backgroundColor: Colors.blue,
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductCrud(
                            isEditing: true,
                            product: product,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.purple,
                      size: 40,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {
                      showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Removing a Product"),
                              content: const Text(
                                  "Are you sure you want to remove this product?"),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                    removeProduct(product);
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            );
                          }).then(
                        (value) => {
                          if (value == true)
                            {
                              ProductService.removeProduct(product)
                                  .then((value) => {print(value)})
                            }
                        },
                      );
                    },
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