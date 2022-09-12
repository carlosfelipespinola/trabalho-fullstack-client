
part of 'products_view.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsCubitState>(
      builder: (context, state) {
        if (state is ProductsCubitBusy) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductsCubitError) {
          return const Center(
            child: Text('Ocorreu um erro ao buscar produtos'),
          );
        }
        return ListView.separated(
          itemCount: state.products.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => ProductListItem(
            product: state.products.elementAt(index),
          )
        );
      }
    );
  }
}