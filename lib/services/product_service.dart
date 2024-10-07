import 'package:dio/dio.dart';
import 'package:fakestore_app/models/products.dart';
import 'package:flutter/foundation.dart';

class ProductApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get('$_baseUrl/products');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to load Products',
        );
      }
    } on DioException catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}
