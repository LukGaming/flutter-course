part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class LoadingProducts extends ProductState {}

class ProductList extends ProductState {
  final List<Product> productList;
  ProductList(this.productList);
}

class ProductMessages extends ProductState {
  final String message;
  ProductMessages(this.message);
}
