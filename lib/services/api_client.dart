import 'package:dio/dio.dart';

class ApiClient {
  static const String _url = 'https://api.escuelajs.co/api/v1/';
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _url,
    ),
  );

  static Future<List> getAPI(String path, {Map<String, dynamic>? data}) async {
    final resp = await _dio.get(
      path,
      queryParameters: data,
    );
    try {
      'Response en getAPI: $resp';
      return resp.data;
    } catch (e) {
      'Error en getAPI $e';
      return resp.data;
    }
  }
}
