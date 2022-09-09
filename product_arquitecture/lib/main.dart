import 'package:flutter/material.dart';
import 'package:product_arquitecture/models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> productList = [
      Product(
        id: 1,
        name: "name",
        description: "description",
        price: 20.0,
      ),
      Product(
        id: 2,
        name: "name",
        description: "description",
        price: 20.0,
      ),
      Product(
        id: 3,
        name: "name",
        description: "description",
        price: 20.0,
      ),
      Product(
        id: 4,
        name: "name",
        description: "description",
        price: 20.0,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) =>
                    ProductListTile(product: productList[index]),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        product.id.toString(),
      ),
      title: Text(product.name),
      trailing: Text("Price:   ${product.price.toString()}"),
    );
  }
}
