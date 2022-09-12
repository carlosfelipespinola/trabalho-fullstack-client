import 'package:client/cubits/auth/auth_cubit.dart';
import 'package:client/cubits/auth/auth_cubit_state.dart';
import 'package:client/cubits/bag/bag.dart';
import 'package:client/cubits/bag/bag_cubit.dart';
import 'package:client/cubits/order/order_creation_cubit.dart';
import 'package:client/cubits/order/order_creation_cubit_states.dart';
import 'package:client/cubits/order/orders_cubit.dart';
import 'package:client/cubits/order/orders_cubit_states.dart';
import 'package:client/cubits/products/products_cubit.dart';
import 'package:client/cubits/products/products_cubit_states.dart';
import 'package:client/services/api/auth.dart';
import 'package:client/services/api/orders.dart';
import 'package:client/services/api/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// injects all global services and cubits in the widget three 
class DependenciesProvider extends StatelessWidget {
  final Widget child;
  const DependenciesProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Orders>(create: (context) => Orders()),
        RepositoryProvider<Auth>(create: (context) => Auth()),
        RepositoryProvider<Products>(create: (context) => Products()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              AuthCubitAuthenticationRequired(),
              authService: context.read()
            )
          ),
          BlocProvider(
            create: (context) => ProductsCubit(
              ProductsCubitSuccess(products: []),
              productsService: context.read()
            )
          ),
          BlocProvider(
            create: (context) => BagCubit(Bag(products: {}))
          ),
          BlocProvider(
            create: (context) => OrderCreationCubit(
              OrderCreationCubitSuccess(),
              authService: context.read(),
              ordersService: context.read()
            )
          ),
          BlocProvider(
            create: (context) => OrdersCubit(
              OrdersCubitSuccess(orders: []),
              authService: context.read(),
              ordersService: context.read()
            )
          )
        ],
        child: child
      ),
    );
  }
}
