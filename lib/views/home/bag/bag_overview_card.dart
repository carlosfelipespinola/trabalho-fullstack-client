

part of 'bag_view.dart';

class BagOverViewCard extends StatelessWidget {
  const BagOverViewCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, Bag>(
      builder: (context, bag) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Preço total:"),
                    Text("R\$ ${bag.price}")
                  ],
                ),
                SizedBox(height: SpacingsHelper.medium,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Método de pagamento"),
                    Text("4555 **** **** ****")
                  ],
                ),
                SizedBox(height: SpacingsHelper.medium,),
                BlocConsumer<OrderCreationCubit, OrderCreationCubitState>(
                  listenWhen: (previous, current) => previous is OrderCreationCubitBusy,
                  listener: (context, state) {
                    if (state is OrderCreationCubitSuccess) {
                      context.read<OrdersCubit>().fetch();
                      context.read<BagCubit>().clear();
                    }
                    if (state is OrderCreationCubitError) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Ocorreu um erro, tente novamente")
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is OrderCreationCubitBusy) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      onPressed: bag.products.isEmpty ? null : () => context.read<OrderCreationCubit>().createOrderFrom(bag),
                      child: const Text("FECHAR PEDIDO")
                    );
                  }
                )
              ],
            ),
          ),
        );
      }
    );
  }
}