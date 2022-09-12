

import 'package:client/services/api/models/order_dto.dart';

abstract class OrdersCubitState {
  List<OrderDto> orders;
  OrdersCubitState({
    required this.orders,
  });
}

class OrdersCubitBusy extends OrdersCubitState {
  OrdersCubitBusy({required List<OrderDto> orders}) : super(orders: orders);

}

class OrdersCubitError extends OrdersCubitState {
  OrdersCubitError({required List<OrderDto> orders}) : super(orders: orders);

}

class OrdersCubitSuccess extends OrdersCubitState {
  OrdersCubitSuccess({required List<OrderDto> orders}) : super(orders: orders);

}