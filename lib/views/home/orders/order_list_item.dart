part of 'orders_view.dart';

class OrderListItem extends StatelessWidget {
  final OrderDto order;

  const OrderListItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Text("Pedido #${order.humanReadableId}"),
      subtitle: Row(
        children: [
          Chip(label: Text("${order.products.length} itens")),
          SizedBox(width: SpacingsHelper.medium,),
          Chip(label: Text("R\$ ${order.price.toStringAsFixed(2)}")),
          SizedBox(width: SpacingsHelper.medium,),
          Chip(label: Text("Pedido ${order.humanReadableStatus}"))
        ],
      ),
    );
  }
}
