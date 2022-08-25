import 'package:chart_provider/components/product_item.dart';
import 'package:chart_provider/models/Product.dart';
import 'package:chart_provider/providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> productsList = provider.items;
    return GridView.builder(
      itemCount: productsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: productsList[index], child: ProductItem()),
    );
  }
}
