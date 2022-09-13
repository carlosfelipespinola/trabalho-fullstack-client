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
        aspectRatio: 1,
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () => showProductBottomSheet(context),
      title: Text(product.name),
      subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
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
