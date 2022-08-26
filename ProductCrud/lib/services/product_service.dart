import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_crud/models/product.dart';

class ProductService {
  static const apiUrl = "http://192.168.0.4:3000/product";
  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      return responseJson.map((product) {
        return Product.fromJson(product);
      }).toList();
    } else {
      throw Exception('failed to get Products');
    }
  }
}
