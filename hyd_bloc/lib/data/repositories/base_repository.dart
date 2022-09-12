import 'package:dio/dio.dart';

class BaseRepository<T> {
  final String apiUrl = "http://179.0.37.34:5000/api";
  Future<T?> postRequest(String path, T request) async {
    try {
      var response = await Dio().post("$apiUrl/$path", data: request);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
