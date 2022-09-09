import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_crud_with_bloc/constants/lorem_const.dart';
import 'package:product_crud_with_bloc/domains/models/product.dart';

part 'product_state.dart';

class ProductCubit extends Bloc<ProductsList, ProductState> {
  ProductCubit() : super(LoadingProducts());
  void getProducts() {
    emit(LoadingProducts());
    List<Product> productList = [];
    Timer(const Duration(seconds: 2), () {
      emit(ProductsList(productList));
    });
  }

  void addProduct() {
    var currentState = state;
    print("the state is");
    print(state);
    if (currentState is ProductsList) {
      List<Product> productList = currentState.productList;
      emit(LoadingProducts());
      productList.add(
        Product(
          id: 7,
          name: "Novo Produto",
          description: lorem_ipsum_description,
          price: 0,
        ),
      );
      Timer(const Duration(seconds: 2), () {
        emit(ProductsList(productList));
      });
    }
  }

  void switchStateToShowImage() {
    emit(LoadingProducts());

    Timer(Duration(seconds: 2), () {
      emit((SwitchStateToShowImage()));
    });
  }

// Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     return data;
//   }

}
