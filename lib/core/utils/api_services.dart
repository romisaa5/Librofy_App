// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  ApiServices({required this.dio});
  final baseUrl = 'https://www.googleapis.com/books/v1/';
  Future<Map<String, dynamic>> get(String endpoint) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
