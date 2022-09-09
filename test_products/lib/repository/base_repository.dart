import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseRepository<T> {
  final String apiUrl = "http://192.168.0.4:3000/products";
  Future<T?> getRequest() async {
    try {
      var request = await http.get(Uri.parse(apiUrl));
      return jsonDecode(request.body);
    } catch (e) {
      return null;
    }
  }
}
