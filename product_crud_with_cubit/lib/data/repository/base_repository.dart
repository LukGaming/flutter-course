import 'package:dio/dio.dart';

class BaseRepository<T> {
  final String apiUrl = "http://192.168.0.4:3000";
  Future<T?> getRequest(String path) async {
    try {
      var result = await Dio().get('${apiUrl}/${path}');
      return result.data;
    } catch (e) {
      return null;
    }
  }

  Future<T?> postRequest(String path, T request) async {
    try {
      var result = await Dio().post('$apiUrl/$path', data: request);
      return result.data;
    } catch (e) {
      return null;
    }
  }

  Future<T?> deleteRequest(String path, int id) async {
    try {
      var result = await Dio().delete(
        '$apiUrl/$path/$id',
      );
      return result.data;
    } catch (e) {
      return null;
    }
  }

  Future<T?> patchRequest(String path, id, request) async {
    try {
      var result = await Dio().put('$apiUrl/$path/$id', data: request);
      return result.data;
    } catch (e) {
      return null;
    }
  }
}
