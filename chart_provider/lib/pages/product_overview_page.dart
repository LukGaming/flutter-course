import 'package:chart_provider/components/app_drawer.dart';
import 'package:chart_provider/components/badge.dart';
import 'package:chart_provider/components/product_grid.dart';
import 'package:chart_provider/providers/cart.dart';
import 'package:chart_provider/providers/product_provider.dart';
import 'package:chart_provider/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverViewPage extends StatelessWidget {
  const ProductsOverViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shopp"),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions value) {
                if (value == FilterOptions.Favorite) {
                  provider.showFavoriteOnly();
                } else {
                  provider.showAll();
                }
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text("Todos"),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.Favorite,
                      child: Text("Favoritos"),
                    ),
                  ]),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
            builder: (ctx, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              color: Colors.red,
              child: child!,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: ProductGrid(),
      ),
      drawer: const AppDrawer(),
    );
  }
}
