import 'package:test_products/business/product_business.dart';
import 'package:test_products/models/product.dart';

class ProductController {
  static Future<List<Product>> getProducts() async {
    var request = await ProductBusiness.getProducts();
    return request;
  }
}
