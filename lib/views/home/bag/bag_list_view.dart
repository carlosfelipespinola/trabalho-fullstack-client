
part of 'bag_view.dart';

class BagListView extends StatelessWidget {
  const BagListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, Bag>(
      builder: (context, bag) {
        if (bag.products.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(SpacingsHelper.medium),
            child: const Center(
              child: Text('Não há produtos na sua sacola. Acesse a página de produtos e toque em um produto para o adicionar à sacola'),
            ),
          );
        }
        return ListView.separated(
          itemCount: bag.products.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => BagListItem(bagProduct: bag.products.elementAt(index),)
        );
      }
    );
  }
}