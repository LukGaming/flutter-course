import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:product_crud_with_bloc/data/logic/cubit/product_cubit.dart';
import 'package:product_crud_with_bloc/presentation/components/product_list_tile.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (BuildContext context) => ProductCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductPage(),
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final ProductCubit _productCubit = BlocProvider.of<ProductCubit>(context);
    _productCubit.getProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Crud"),
      ),
      body: BlocProvider<ProductCubit>(
        create: (context) => _productCubit,
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is LoadingProducts) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductsList) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ProductListItem(product: state.productList[index]),
                  );
                },
                itemCount: state.productList.length,
              );
            } else if (state is SwitchStateToShowImage) {
              return Text("Showing Images!");
            }

            return Container();
          },
        ),
      ),
      floatingActionButton: BlocProvider(
        create: (_) => _productCubit,
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _productCubit.switchStateToShowImage();
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _productCubit.addProduct();
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.add),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
