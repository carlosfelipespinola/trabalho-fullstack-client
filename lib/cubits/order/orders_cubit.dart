
import 'package:client/cubits/order/orders_cubit_states.dart';
import 'package:client/services/api/auth.dart';
import 'package:client/services/api/orders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersCubitState> {
  Orders ordersService;
  Auth authService;

  OrdersCubit(OrdersCubitState initialState, {required this.ordersService, required this.authService}) : super(initialState);

  fetch () async {
    try {
      emit(OrdersCubitBusy(orders: state.orders));
      final orders = await ordersService.fetch(authService.user.id);
      emit(OrdersCubitSuccess(orders: orders));
    } catch (_) {
      emit(OrdersCubitError(orders: state.orders));
    }
  }
}