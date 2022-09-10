import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_crud_with_cubit/cubit/Auth/auth_cubit.dart';

import 'package:product_crud_with_cubit/cubit/product/product_cubit.dart';
import 'package:product_crud_with_cubit/presentation/components/product_list_tile.dart';
import 'package:product_crud_with_cubit/presentation/screens/product_form.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);
    productCubit.getProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: const BlocConsumerMessages(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProductFormView(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BlocConsumerMessages extends StatelessWidget {
  const BlocConsumerMessages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);
    return BlocBuilder<ProductCubit, ProductState>(
      bloc: productCubit,
      builder: (context, state) {
        if (state is LoadingProducts) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductList) {
          return ListView.builder(
            itemCount: state.productList.length,
            itemBuilder: (context, index) =>
                ProductListTile(product: state.productList[index]),
          );
        }
        return Container();
      },
    );
  }
}
