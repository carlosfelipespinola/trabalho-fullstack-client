

import 'package:client/cubits/bag/bag_product.dart';

class Bag {
  final Set<BagProduct> products;

  Bag({
    required this.products,
  });

  num get price => products.isEmpty ? 0 : products.map((e) => e.totalPrice).reduce((a, b) => a + b);

  Bag copyWith({
    Set<BagProduct>? products,
  }) {
    return Bag(
      products: products ?? this.products,
    );
  }
}

