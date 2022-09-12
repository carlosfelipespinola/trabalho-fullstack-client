
import 'package:client/services/api/models/product_dto.dart';

abstract class ProductsCubitState {
  List<ProductDto> products;

  ProductsCubitState({
    required this.products,
  });
}

class ProductsCubitBusy extends ProductsCubitState {
  ProductsCubitBusy({required List<ProductDto> products}) : super(products: products);
}

class ProductsCubitError extends ProductsCubitState {
  ProductsCubitError({required List<ProductDto> products}) : super(products: products);

}

class ProductsCubitSuccess extends ProductsCubitState {
  ProductsCubitSuccess({required List<ProductDto> products}) : super(products: products);

}