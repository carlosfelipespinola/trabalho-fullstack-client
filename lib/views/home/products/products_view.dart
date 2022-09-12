

import 'package:client/cubits/bag/bag_cubit.dart';
import 'package:client/cubits/bag/bag_product.dart';
import 'package:client/cubits/products/products_cubit.dart';
import 'package:client/cubits/products/products_cubit_states.dart';
import 'package:client/helpers/spacings_helper.dart';
import 'package:client/services/api/models/product_dto.dart';
import 'package:client/widgets/form_fields/counter_form_field.dart';
import 'package:client/widgets/rounded_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_list_view.dart';
part 'product_bottom_dialog.dart';
part 'product_list_item.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      body: const ProductsListView(),
    );
  }
}