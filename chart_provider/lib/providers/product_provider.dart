import 'package:chart_provider/mock/dummy_data.dart';
import 'package:chart_provider/models/Product.dart';
import 'package:flutter/cupertino.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  List<Product> get items => [..._items];
  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
