import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_crud_with_cubit/cubit/product/product_cubit.dart';
import 'package:product_crud_with_cubit/data/models/product.dart';
import 'package:product_crud_with_cubit/presentation/screens/product_form.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    ProductCubit productCubit = BlocProvider.of<ProductCubit>(context);
    return Stack(
      children: [
        ListTile(
          title: Text(product.name),
          leading: Text(
            'Id: ${product.id}',
          ),
          subtitle: Text(product.description),
          trailing: Text('R\$ ${product.price}'),
        ),
        Positioned(
          right: 0,
          top: 5,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductFormView(
                        isEditing: true,
                        product: product,
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  productCubit.deleteProduct(product);
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
