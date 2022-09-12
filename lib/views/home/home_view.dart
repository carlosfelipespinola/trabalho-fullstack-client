import 'package:client/cubits/bag/bag.dart';
import 'package:client/cubits/bag/bag_cubit.dart';
import 'package:client/cubits/order/order_creation_cubit.dart';
import 'package:client/cubits/order/order_creation_cubit_states.dart';
import 'package:client/cubits/order/orders_cubit.dart';
import 'package:client/cubits/products/products_cubit.dart';
import 'package:client/views/home/bag/bag_view.dart';
import 'package:client/views/home/orders/orders_view.dart';
import 'package:client/views/home/products/products_view.dart';
import 'package:client/widgets/icon_with_counter_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeView extends StatefulWidget {

  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late List<IndexedPageData> pages;
  int selectedPageIndex = 0;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProductsCubit>().fetch();
    context.read<OrdersCubit>().fetch();
    pages = [
      IndexedPageData(
        index: 0,
        icon: const Icon(Icons.search),
        name: 'Produtos',
        page: const ProductsView()
      ),
      IndexedPageData(
        index: 1,
        icon: BlocBuilder<BagCubit, Bag>(
          builder: (context, bag) {
            if (bag.products.isEmpty) {
              return const Icon(Icons.shopping_bag);
            } else {
              return IconWithCounterBadge(Icons.shopping_bag, counter: bag.products.length);
            }
          }
        ),
        name: 'Sacola',
        page: const BagView()
      ),
      IndexedPageData(
        index: 2,
        icon: const Icon(Icons.receipt),
        name: 'Pedidos',
        page: const OrdersView()
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderCreationCubit, OrderCreationCubitState>(
          listenWhen: (oldState, newState) => oldState is OrderCreationCubitBusy && newState is OrderCreationCubitSuccess,
          listener: (_, __) => onOrderCreated()
        )
      ],
      child: Scaffold(
        body: pageAt(selectedPageIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPageIndex,
          onTap: onPageChange,
          items: bottomNavigationItems,
        ),
      ),
    );
  }

  void onOrderCreated() {
    if (mounted) {
      setState(() {
        activeOrdersPage();
      });
    }
  }

  void activeOrdersPage() {
    selectedPageIndex = pages.length - 1;
  }

  void onPageChange(int pageIndex) {
    setState(() {
      selectedPageIndex = pageIndex;
    });
  }

  List<BottomNavigationBarItem> get bottomNavigationItems {
    return pages.map((e) => BottomNavigationBarItem(
      icon: e.icon,
      label: e.name,
    )).toList(growable: false);
  }

  Widget pageAt(int index) => pages.elementAt(index).page;
}

class IndexedPageData {
  final int index;
  final Widget icon;
  final String name;
  final Widget page;

  IndexedPageData({
    required this.index,
    required this.icon,
    required this.name,
    required this.page,
  });
}