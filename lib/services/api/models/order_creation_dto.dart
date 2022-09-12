

import 'package:client/services/api/models/order_product_dto.dart';

class OrderCreationDto {
  String creditCardCvv;
  String creditCardNumber;
  String creditCardOwner;
  DateTime timestamp;
  List<OrderProductDto> products;
  String user;

  OrderCreationDto({
    required this.creditCardCvv,
    required this.creditCardNumber,
    required this.creditCardOwner,
    required this.timestamp,
    required this.products,
    required this.user
  });

  Map<String, dynamic> toMap() {
    return {
      "creditCardCvv": creditCardCvv,
      "creditCardNumber": creditCardNumber,
      "creditCardOwner": creditCardOwner,
      "products": products.map((e) => e.toMap()).toList(),
      "timestamp": timestamp.toUtc().toIso8601String(),
      "user": user
    };
    // return {
    //   'creditCardCvv': creditCardCvv,
    //   'creditCardNumber': creditCardNumber,
    //   'creditCardOwner': creditCardOwner,
    //   'timestamp': timestamp.toIso8601String(),
    //   'products': products.map((e) => e.toMap()).toList(),
    //   'user': user
    // };
  }
}
