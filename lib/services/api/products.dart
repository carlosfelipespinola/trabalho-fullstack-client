
import 'package:client/services/api/exceptions/api_exception.dart';
import 'package:client/services/api/models/product_dto.dart';
import 'package:dio/dio.dart';

class Products {
  final _client = Dio(BaseOptions(baseUrl: 'https://trabalho-fullstack-produto.herokuapp.com/product'));

  Future<List<ProductDto>> fetchAll() async {
    final response = await _client.get('/search/all');
    if (response.statusCode == 200) {
      return (response.data as List)
        .map((map) => ProductDto.fromMap(map))
        .toList()
        ..sort((a, b) => a.category.compareTo(b.category));
    }
    throw ApiException();
  }
}