part of 'orders_view.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersCubitState>(
      builder: (context, state) {
        if (state is OrdersCubitBusy) return const Center(child: CircularProgressIndicator());
        if (state is OrdersCubitError) return const _OrderListError();
        if (state.orders.isEmpty) return const _OrderListEmpty();
        return ListView.separated(
          itemCount: state.orders.length,
          physics: const AlwaysScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => OrderListItem(order: state.orders.elementAt(index),)
        );
      }
    );
  }
}

class _OrderListError extends StatelessWidget {
  const _OrderListError({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        const Text("Ocorreu um erro ao buscar pedidos"),
        SizedBox(height: SpacingsHelper.medium,),
        ElevatedButton.icon(
          onPressed: context.read<OrdersCubit>().fetch,
          icon: const Icon(Icons.refresh),
          label: const Text("Atualizar")
        )
      ],
    ));
  }
}

class _OrderListEmpty extends StatelessWidget {
  const _OrderListEmpty({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SpacingsHelper.medium),
      child: const Center(
        child: Text("Você ainda não fez um pedido. Para fazer um pedido acesse a listagem de produtos, adicone-os a sacola e finalize sua compra"),
      ),
    );
  }
}