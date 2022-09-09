import 'package:mobx/mobx.dart';
import '../models/product.dart';

class ProductStore with Store {
  @observable
  final List<Product> productList = [];
}
