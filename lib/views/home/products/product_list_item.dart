part of 'products_view.dart';

class ProductListItem extends StatelessWidget {
  final ProductDto product;

  const ProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RoundedAvatar(
        child: Image.network(product.imageUrl),
      ),
      onTap: () => showProductBottomSheet(context),
      title: Text(product.name),
      subtitle: Text(product.price.toString()),
    );
  }

  void showProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(SpacingsHelper.medium),
          child: ProductDetailsBottomSheet(product: product)
        );
      }
    );
  }
}
