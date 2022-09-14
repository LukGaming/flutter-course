import 'package:dio/dio.dart';

class BaseRespository<T> {
  BaseRespository() {
    print("Instance of baseRepository");
  }
  final String apiUrl = "http://179.0.37.34:5000/api";
  Future<T?> postRequest(String path, T request) async {
    try {
      final response = await Dio().post('$apiUrl/$path', data: request);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
