import 'package:chart_provider/models/cart_item.dart';
import 'package:chart_provider/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem.productId);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(cartItem.name.toString()),
            subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}'),
            trailing: Text('${cartItem.quantity.toString()} X'),
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '${cartItem.price}',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
