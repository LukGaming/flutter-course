import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_crud/models/product.dart';

class ProductService {
  static const apiUrl = "http://192.168.0.4:3000/product";

  static Future getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      List<Product> produtos = [];
      for (var i = 0; i < result.length; i++) {
        var currentProduct = Product.fromJson(result[i]);
        produtos.add(currentProduct);
      }
      return produtos;
    } else {
      throw Exception('failed to get Products');
    }
  }
}
