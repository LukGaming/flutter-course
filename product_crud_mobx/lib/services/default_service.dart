import 'dart:convert';
import 'package:http/http.dart' as http;

class DefaultService {
  static String apiUrl = "http://192.168.0.4:3000/";

  static Future getList(String endpoint) async {
    final finalUrl = '$apiUrl$endpoint';
    print(finalUrl);
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      final List responseToList = jsonDecode(response.body);
      return responseToList.toList();
    }
  }
}
