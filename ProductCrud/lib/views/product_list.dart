import 'package:flutter/material.dart';
import 'package:product_crud/components/product_list_item.dart';
import 'package:product_crud/models/product.dart';
import 'package:product_crud/services/product_service.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductList();
}

class _ProductList extends State<ProductList> {
  List<Product> _products = [];
  @override
  void initState() {
    ProductService.getProducts().then((value) {
      setState(() {
        _products = value;
      });
    });
    super.initState();
  }

  removeProduct(Product product) {
    setState(() {
      _products.removeWhere((element) => element.id == product.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Crud"),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => SingleChildScrollView(
          child: ProductlistItem(
              product: _products[index], removeProduct: removeProduct),
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
