import 'package:chart_provider/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("Welcome"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text("Store"),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.HOME,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text("Orders"),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.ORDERS,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text("Product Managment"),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.PRODUCT_MANAGMENT,
            ),
          ),
        ],
      ),
    );
  }
}
