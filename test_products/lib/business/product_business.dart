import 'package:test_products/models/product.dart';
import 'package:test_products/repository/base_repository.dart';

class ProductBusiness {
  static Future<List<Product>> getProducts() async {
    List<Product> productList = [];
    var baseRepository = BaseRepository();
    var request = await baseRepository.getRequest();
    if (request == null) return productList;
    request.forEach((element) {
      Product currentProduct = Product.fromJson(element);
      productList.add(currentProduct);
    });
    return productList;
  }
}
