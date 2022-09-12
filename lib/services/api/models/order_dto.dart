
import 'package:client/services/api/models/order_product_dto.dart';

class OrderDto {
  String id;
  num price;
  List<OrderProductDto> products;
  String status;
  String user;

  OrderDto({
    required this.id,
    required this.price,
    required this.products,
    required this.status,
    required this.user,
  });

  String get humanReadableId => id.split('-').first;

  String get humanReadableStatus {
    final mapping = {
      'pending': 'Pedente',
      'canceled': 'Cancelado',
      'accepted': 'Aceito'
    };
    return mapping[status] ?? '-';
  }

  factory OrderDto.fromMap(Map<String, dynamic> map) {
    return OrderDto(
      id: map['id'],
      price: map['price'],
      status: map['status'],
      user: map['usuario'],
      products: (map['products'] as List)
        .map((e) => e as Map)
        .map((e) => OrderProductDto.fromMap(e))
        .toList()
    );
  }
}
