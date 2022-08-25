import 'package:chart_provider/mock/dummy_data.dart';
import 'package:chart_provider/models/Product.dart';
import 'package:flutter/cupertino.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  bool _showFavoriteOnly = false;
  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((prod) => (prod.isFavorite)).toList();
    }
    return [..._items];
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }
}
