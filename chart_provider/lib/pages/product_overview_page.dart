import 'package:chart_provider/components/product_grid.dart';
import 'package:chart_provider/components/product_item.dart';
import 'package:chart_provider/models/Product.dart';
import 'package:chart_provider/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsOverViewPage extends StatelessWidget {
  const ProductsOverViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shopp"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: ProductGrid(),
      ),
    );
  }
}
