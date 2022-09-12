
import 'package:client/cubits/products/products_cubit_states.dart';
import 'package:client/services/api/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsCubitState> {
  final Products _productsService;

  ProductsCubit(
    ProductsCubitState initialState, {
      required Products productsService
    }
  ) : _productsService = productsService, super(initialState);

  fetch() async {
    try {
      emit(ProductsCubitBusy(products: state.products));
      final products = await _productsService.fetchAll();
      emit(ProductsCubitSuccess(products: products));
    } catch (_) {
      emit(ProductsCubitError(products: state.products));
    }
  }
}