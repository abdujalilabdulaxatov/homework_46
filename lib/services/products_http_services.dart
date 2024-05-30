import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductsHttpServices {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse(
        'https://dars46-2e84c-default-rtdb.firebaseio.com/products.json');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<Product> loadedProducts = [];

    if (data != null) {
      data.forEach((key, value) {
        loadedProducts.add(Product.fromJson(value));
      });
    }
    print(data);
    print(loadedProducts);

    return loadedProducts;
  }
}
