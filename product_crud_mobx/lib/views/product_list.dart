import 'package:flutter/material.dart';
import 'package:product_crud_mobx/models/product.dart';
import 'package:product_crud_mobx/services/default_service.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Product> productList = [];
  @override
  void initState() {
    DefaultService.getList("product").then((response) {
      for (var i = 0; i < response.length; i++) {
        Product currentProduct = Product.fromJson(response[i]);
        setState(() {
          productList.add(currentProduct);
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List View"),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Row(
              children: [const Text("teste")],
            );
          },
          itemCount: 2,
        )),
      ),
    );
  }
}
