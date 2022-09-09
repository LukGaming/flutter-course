import 'dart:convert';

import 'package:cep_bloc/models/cep_request.dart';
import 'package:http/http.dart' as http;

class CepRepository<T> {
  Future<T?> getRequest(
    String cep,
  ) async {
    try {
      var request = await http.get(
        Uri.parse('https://viacep.com.br/ws/${cep}/json/'),
      );
      return jsonDecode(request.body);
    } catch (e) {
      return null;
    }
  }
}
