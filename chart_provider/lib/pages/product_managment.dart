import 'package:chart_provider/components/app_drawer.dart';
import 'package:chart_provider/components/product_Item_managment.dart';
import 'package:chart_provider/models/Product.dart';
import 'package:chart_provider/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductManagmentPage extends StatelessWidget {
  const ProductManagmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductList>(context);
    final List<Product> products = productProvider.items.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Managment"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProdutItemManagment(product: products[index]);
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
