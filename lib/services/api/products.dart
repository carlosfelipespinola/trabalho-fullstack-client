
import 'package:client/services/api/models/product_dto.dart';

class Products {

  Future<List<ProductDto>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      ProductDto(
        imageUrl: 'https://picsum.photos/200',
        id: "a2a3a4",
        name: "X-Salada simples",
        description: "Pão, Hamburger 200g, Alface e Tomate",
        price: 20.99
      ),
      ProductDto(
        imageUrl: 'https://picsum.photos/200',
        id: "b3b4b5",
        name: "X-Salada especial",
        description: "Pão, Hamburger 200g, Ovo, Milho, Alface e Tomate",
        price: 24.99
      ),
      ProductDto(
        imageUrl: 'https://picsum.photos/200',
        id: "c6c7c8",
        name: "X-Bacon",
        description: "Pão, Hamburger 200g, Bacon, Picles",
        price: 25.99
      ),
      ProductDto(
        imageUrl: 'https://picsum.photos/200',
        id: "d10d11",
        name: "Coca-Cola 200ml",
        description: "",
        price: 5.99
      ),
      ProductDto(
        imageUrl: 'https://picsum.photos/200',
        id: "e20e30",
        name: "Fanta 200ml",
        description: "",
        price: 5.99
      )
    ];
  }
}