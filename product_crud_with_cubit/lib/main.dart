import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_crud_with_cubit/cubit/Auth/auth_cubit.dart';
import 'package:product_crud_with_cubit/cubit/Utils/utils_cubit.dart';
import 'package:product_crud_with_cubit/cubit/product/product_cubit.dart';
import 'package:product_crud_with_cubit/presentation/screens/product_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final utilsCubit = UtilsCubit();
    final authCubit = AuthCubit(utilsCubit: utilsCubit);
    final productCubit =
        ProductCubit(authCubit: authCubit, utilsCubit: utilsCubit);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: utilsCubit),
        BlocProvider.value(value: authCubit),
        BlocProvider.value(value: productCubit),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<UtilsCubit, UtilsState>(
          builder: (context, state) {
            return const ProductListView();
          },
        ),
      ),
    );
  }
}
