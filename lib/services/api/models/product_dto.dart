

class ProductDto {
  String id;
  String name;
  String description;
  String imageUrl;
  num price;

  ProductDto({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}
