part of 'bag_view.dart';

class BagListItem extends StatelessWidget {
  final BagProduct bagProduct;

  const BagListItem({
    Key? key,
    required this.bagProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: false,
      leading: RoundedAvatar(
        child: Image.network(bagProduct.product.imageUrl),
      ),
      title: Text(bagProduct.product.name),
      subtitle: Text(description),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => removeFromBag(context),
      ),
    );
  }

  void removeFromBag(BuildContext context) {
    context.read<BagCubit>().remove(bagProduct);
  }

  String get description => "${bagProduct.quantity} X R\$ ${bagProduct.product.price} = R\$ ${bagProduct.totalPrice}";
}
