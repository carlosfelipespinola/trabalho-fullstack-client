

import 'package:client/cubits/bag/bag.dart';
import 'package:client/cubits/bag/bag_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagCubit extends Cubit<Bag> {


  BagCubit(Bag initialState)  : super(initialState);

  insert(BagProduct bagProduct) {
    if (state.products.contains(bagProduct)) {
      final currentBagProduct = state.products.lookup(bagProduct)!;
      currentBagProduct.quantity += bagProduct.quantity;
    } else {
      state.products.add(bagProduct);
    }
    emit(Bag(products: state.products.toSet()));
  }

  remove(BagProduct bagProduct) {
    state.products.remove(bagProduct);
    emit(Bag(products: state.products.toSet()));
  }

  clear() {
    state.products.clear();
    emit(Bag(products: state.products.toSet()));
  }

}