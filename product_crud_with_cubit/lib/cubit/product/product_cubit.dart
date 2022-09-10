import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_crud_with_cubit/cubit/Auth/auth_cubit.dart';
import 'package:product_crud_with_cubit/cubit/Utils/utils_cubit.dart';
import 'package:product_crud_with_cubit/data/models/product.dart';
import 'package:product_crud_with_cubit/data/models/product_request.dart';
import 'package:product_crud_with_cubit/data/repository/base_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final AuthCubit authCubit;
  final UtilsCubit utilsCubit;
  ProductCubit({
    required this.authCubit,
    required this.utilsCubit,
  }) : super(LoadingProducts());
  void getProducts() async {
    authCubit.logUser();
    var baseRepository = BaseRepository();
    List response = await baseRepository.getRequest("products");
    List<Product> productList =
        (response.map((value) => Product.fromJson(value))).toList();
    emit(
      ProductList(productList),
    );
  }

  Future<void> createProduct({
    required String name,
    required String description,
    required String price,
  }) async {
    ProductRequest productRequest =
        ProductRequest(name: name, description: description, price: price);
    var baseRepository = BaseRepository();
    var result =
        await baseRepository.postRequest("products", productRequest.toJson());
    var currentState = state;
    if (currentState is ProductList) {
      List<Product> productList = currentState.productList;
      var newProduct = Product.fromJson(result);
      productList.add(newProduct);
      emit(ProductMessages("Produto criado com sucesso!"));
      emit(ProductList(productList));
    }
  }

  Future<void> deleteProduct(Product product) async {
    var baseRepository = BaseRepository();
    await baseRepository.deleteRequest("products", product.id);
    var currentState = state;
    if (currentState is ProductList) {
      List<Product> productList = currentState.productList;
      productList.remove(product);
      emit(ProductMessages("Produto deletado com sucesso!"));
      emit(ProductList(productList));
    }
    utilsCubit.showDialog("teste");
  }

  Future<void> editProduct({
    required int id,
    required String name,
    required String description,
    required String price,
  }) async {
    final currentAuthState = authCubit.state;
    if (currentAuthState is UserAccess) {
      authCubit.logUser();
      print(currentAuthState.isLogged);
    }

    Product product = Product(
      id: id,
      name: name,
      description: description,
      price: price,
    );
    var baseRepository = BaseRepository();
    final response = await baseRepository.patchRequest(
      "products",
      product.id,
      product.toJson(),
    );
    var currentState = state;
    if (currentState is ProductList) {
      Product editedProduct = Product.fromJson(response);
      List<Product> productList = currentState.productList;
      int productIndex =
          productList.indexWhere((element) => element.id == editedProduct.id);
      productList[productIndex] = editedProduct;
      emit(ProductMessages("Produto editado com sucesso!"));
      emit(ProductList(productList));
    }
  }
}
