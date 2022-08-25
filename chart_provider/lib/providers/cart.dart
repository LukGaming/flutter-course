import 'dart:math';

import 'package:chart_provider/models/Product.dart';
import 'package:chart_provider/models/cart_item.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void removeItem(String productId) {
    print("removing item");
    _items.remove(productId);
    notifyListeners();
  }

  void clearList() {
    _items = {};
    notifyListeners();
  }

  int get itemsCount {
    return _items.length;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => CartItem(
                id: existingItem.id,
                productId: existingItem.productId,
                name: existingItem.name,
                quantity: existingItem.quantity + 1,
                price: existingItem.price,
              ));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: Random().nextDouble().toString(),
                productId: product.id,
                name: product.name,
                quantity: 1,
                price: product.price,
              ));
    }
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
