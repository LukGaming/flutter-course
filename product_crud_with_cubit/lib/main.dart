import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_crud_with_cubit/cubit/Auth/auth_cubit.dart';
import 'package:product_crud_with_cubit/cubit/Utils/utils_cubit.dart';
import 'package:product_crud_with_cubit/cubit/product/product_cubit.dart';
import 'package:product_crud_with_cubit/presentation/screens/product_list_view.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UtilsCubit(),
        ),
        BlocProvider(
          create: (context) =>
              AuthCubit(utilsCubit: context.read<UtilsCubit>()),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            authCubit: context.read<AuthCubit>(),
            utilsCubit: context.read<UtilsCubit>(),
          ),
        ),
        // BlocProvider.value(value: utilsCubit),
        // BlocProvider.value(value: authCubit),
        // BlocProvider.value(value: productCubit),
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
