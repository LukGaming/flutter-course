import 'package:chart_provider/pages/cart.dart';
import 'package:chart_provider/pages/product_detail_page.dart';
import 'package:chart_provider/pages/product_overview_page.dart';
import 'package:chart_provider/providers/cart.dart';
import 'package:chart_provider/providers/product_provider.dart';
import 'package:chart_provider/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange)),
        home: ProductsOverViewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailPage(),
          AppRoutes.CART: (context) => CartPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
