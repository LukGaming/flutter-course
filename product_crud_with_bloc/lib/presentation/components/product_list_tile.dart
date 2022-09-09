import 'package:flutter/material.dart';
import 'package:product_crud_with_bloc/domains/models/product.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        '${product.description}...',
        maxLines: 1,
      ),
      title: Text(product.name),
      leading: Text(
        'Id: ${product.id}',
      ),
      trailing: Text('R\$ ${product.price.toStringAsFixed(2)}'),
    );
  }
}
