import 'package:chart_provider/components/cart_item.dart';
import 'package:chart_provider/models/order.dart';
import 'package:chart_provider/providers/cart.dart';
import 'package:chart_provider/providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final cartItems = cartProvider.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Chip(
                        backgroundColor: Colors.purple,
                        label: Text(
                          'R\$ ${cartProvider.totalAmount}',
                          style: const TextStyle(color: Colors.white),
                        )),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Provider.of<OrderProvider>(context, listen: false)
                              .addOrder(
                            cartProvider,
                          );
                          cartProvider.clearList();
                        },
                        child: const Text(
                          "Comprar",
                          style: TextStyle(fontSize: 20),
                        ))
                  ]),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) =>
                CartItemWidget(cartItem: cartItems[index]),
          ))
        ],
      ),
    );
  }
}
