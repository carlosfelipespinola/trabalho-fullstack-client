

class ProductDto {
  String id;
  String name;
  String description;
  String imageUrl;
  num price;
  String category;

  ProductDto({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category
  });

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      imageUrl: map['photoLocation'],
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: num.parse(map['price']),
      category: map['categoriesDto']['name']
    );
  }
}
