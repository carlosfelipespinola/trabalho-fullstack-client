

import 'package:client/services/api/models/product_dto.dart';

class BagProduct {

  String get id => product.id;

  ProductDto product;

  int quantity;
  
  BagProduct({
    required this.product,
    required this.quantity,
  });

  num get totalPrice => product.price * quantity;

  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BagProduct &&
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
