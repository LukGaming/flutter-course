import 'dart:convert';
import 'package:test/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String apiUrl = "http://192.168.0.4:3000/";
  Future<List<Product>> getProducts() async {
    final res = await http.get(Uri.parse(apiUrl));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Filted to load Products');
    }
  }
}
