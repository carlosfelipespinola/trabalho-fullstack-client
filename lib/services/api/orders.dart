import 'package:client/services/api/exceptions/api_exception.dart';
import 'package:client/services/api/models/order_creation_dto.dart';
import 'package:client/services/api/models/order_dto.dart';
import 'package:dio/dio.dart';

class Orders {
  final Dio _client = Dio(
    BaseOptions(baseUrl: 'https://fathomless-reaches-54421.herokuapp.com/orders')
  );

  Future<OrderDto> create(OrderCreationDto dto) async {
    try {
      Map<String, dynamic> map = dto.toMap();
      final response = await _client.post('', data: map);
      if (response.statusCode == 201) {
        return OrderDto.fromMap(response.data as Map<String, dynamic>);
      }
    } catch (_) {}
    throw ApiException();
  }

  Future<List<OrderDto>> fetch(String userId) async {
    try {
      // final response = await _client.get('/user/$userId');
      final response = await _client.get('');
      if (response.statusCode == 200) {
        final orders = response.data as List;
        return orders.map(
          (orderMap) => OrderDto.fromMap(orderMap)
        ).toList();
      }
    } catch (_) {}
    throw ApiException();
  }

  Future<OrderDto> cancel(String userId, String orderId) async {
    try {
      final response = await _client.patch('/user/$userId/order/$orderId/cancel');
      if (response.statusCode == 200) {
        final decodedResponse = response.data as Map<String, dynamic>;
        return OrderDto.fromMap(decodedResponse);
      }
    } catch (_) {}
    throw ApiException();
  }
}