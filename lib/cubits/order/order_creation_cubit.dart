
import 'package:client/cubits/bag/bag.dart';
import 'package:client/cubits/order/order_creation_cubit_states.dart';
import 'package:client/services/api/auth.dart';
import 'package:client/services/api/models/order_creation_dto.dart';
import 'package:client/services/api/models/order_product_dto.dart';
import 'package:client/services/api/orders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCreationCubit extends Cubit<OrderCreationCubitState> {
  Orders ordersService;
  Auth authService;
  OrderCreationCubit(OrderCreationCubitState initialState, {required this.ordersService, required this.authService}) : super(initialState);

  createOrderFrom(Bag bag) async {
    try {
      emit(OrderCreationCubitBusy());
      await ordersService.create(OrderCreationDto(
        user: authService.user.id,
        creditCardCvv: "123",
        creditCardNumber: "1234 4567 8910 1112",
        creditCardOwner: "CREDIT C OWNER",
        timestamp: DateTime.now(),
        products: bag.products.map((e) => OrderProductDto(
          name: e.product.name,
          price: e.product.price,
          quantity: e.quantity
        )).toList()
      ));
      emit(OrderCreationCubitSuccess());
    } catch (_) {
      emit(OrderCreationCubitError());
    }
  }
}