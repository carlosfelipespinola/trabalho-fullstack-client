

class OrderProductDto {
  String name;
  num price;
  int quantity;

  OrderProductDto({
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory OrderProductDto.fromMap(Map map) {
    return OrderProductDto(
      name: map['name'],
      price: map['price'],
      quantity: map['quantity']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity
    };
  }
}
