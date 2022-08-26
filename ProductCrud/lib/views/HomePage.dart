import 'package:flutter/material.dart';
import 'package:product_crud/models/product.dart';
import 'package:product_crud/services/product_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> _products = [
    Product(
        id: 0,
        name: "teste",
        description: "teste",
        price: "200",
        categoryId: 0),
  ];
  @override
  void initState() {
    super.initState();
    ProductService.getProducts().then((value) {
      print(value.toList().length);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Crud"),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return const Text("Teste");
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
