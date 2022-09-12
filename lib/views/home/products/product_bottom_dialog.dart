part of 'products_view.dart';

class ProductDetailsBottomSheet extends StatefulWidget {
  final ProductDto product;

  const ProductDetailsBottomSheet({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsBottomSheet> createState() => _ProductDetailsBottomSheetState();
}

class _ProductDetailsBottomSheetState extends State<ProductDetailsBottomSheet> {

  int quantity = 0;

  num get totalPrice => widget.product.price * quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RoundedAvatar(
          child: Image.network(
            widget.product.imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
            height: 200,
          ),
        ),
        SizedBox(height: SpacingsHelper.medium,),
        Text(
          widget.product.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: SpacingsHelper.medium,),
        Text(widget.product.description),
        const Spacer(),
        Row(
          children: [
            CounterFormField(onChange: onQuantityChange),
            SizedBox(width: SpacingsHelper.large,),
            Expanded(
              child: ElevatedButton(
                onPressed: quantity > 0 ? insertProductToBagAndPop : null,
                child: Row(
                  children: [
                    const Text("ADICIONAR"),
                    const Spacer(),
                    Text("R\$ $totalPrice")
                  ],
                )
              ),
            )
          ],
        )
      ],
    );
  }


  void onQuantityChange(int quantity) {
    setState(() {
      this.quantity = quantity;
    });
  }

  void insertProductToBagAndPop() {
    context.read<BagCubit>().insert(BagProduct(
      product: widget.product,
      quantity: quantity
    ));
    Navigator.of(context).pop();
  }
}