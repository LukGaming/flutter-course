import 'package:chart_provider/components/app_drawer.dart';
import 'package:chart_provider/components/order_widget.dart';
import 'package:chart_provider/providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderProvider orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus pedidos"),
      ),
      body: ListView.builder(
          itemCount: orders.itemsCount,
          itemBuilder: (context, index) =>
              OrderWidget(order: orders.items[index])),
      drawer: const AppDrawer(),
    );
  }
}
