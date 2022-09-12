import 'package:client/cubits/order/orders_cubit.dart';
import 'package:client/cubits/order/orders_cubit_states.dart';
import 'package:client/helpers/spacings_helper.dart';
import 'package:client/services/api/models/order_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_list_item.dart';
part 'order_list_view.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<OrdersCubit>().fetch(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Pedidos")),
        body: const OrderListView(),
      ),
    );
  }
}