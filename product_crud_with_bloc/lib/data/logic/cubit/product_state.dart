part of 'product_cubit.dart';

abstract class ProductState {}

class LoadingProducts extends ProductState {}

class ProductsList extends ProductState {
  final List<Product> productList;
  ProductsList(this.productList);
}

class SwitchStateToShowImage extends ProductState {}
