import 'package:flutter/material.dart';
import 'package:product_crud/models/product.dart';
import 'package:product_crud/services/product_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> _products = [];
  Future<void> _getProducts() async {
    var products = await ProductService.getProducts();
    setState(() {
      _products = products;
    });
  }

  @override
  void initState() {
    setState(() {
      _getProducts();
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Crud"),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return Row(
            children: [const Text("teste")],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
