

import 'package:client/cubits/bag/bag.dart';
import 'package:client/cubits/bag/bag_cubit.dart';
import 'package:client/cubits/bag/bag_product.dart';
import 'package:client/cubits/order/order_creation_cubit.dart';
import 'package:client/cubits/order/order_creation_cubit_states.dart';
import 'package:client/cubits/order/orders_cubit.dart';
import 'package:client/helpers/spacings_helper.dart';
import 'package:client/widgets/rounded_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bag_list_view.dart';
part 'bag_list_item.dart';
part 'bag_overview_card.dart';

class BagView extends StatelessWidget {
  const BagView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, Bag>(
      builder: (context, bag) {
        return Scaffold(
          appBar: AppBar(title: const Text("Sacola")),
          body: const BagListView(),
          bottomSheet: const BagOverViewCard()
        );
      }
    );
  }

  
}