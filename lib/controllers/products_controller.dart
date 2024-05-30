import 'package:homework/models/product.dart';
import 'package:homework/services/products_http_services.dart';

class ProductsController {
  final productsHttpServices = ProductsHttpServices();

  Future<List<Product>> getProducts() async {
    List<Product> product = await productsHttpServices.getProducts();
    return product;
  }
}
