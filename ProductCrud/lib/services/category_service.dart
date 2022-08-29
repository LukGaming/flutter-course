import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_crud/models/category.dart';

class CategoryService {
  static String categoryUrl = 'http://192.168.0.4:3000/category';
  static Future getCategories() async {
    final response = await http.get(Uri.parse(categoryUrl));
    if (response.statusCode == 200) {
      List<Category> categories = [];
      List categoriesResponse = jsonDecode(response.body);
      for (var i = 0; i < categoriesResponse.length; i++) {
        var currentCategory = Category.fromJson(categoriesResponse[i]);
        print('Category: ${currentCategory}');
        categories.add(currentCategory);
      }
      return categories;
    }
  }
}
