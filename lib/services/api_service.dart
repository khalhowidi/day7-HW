import 'dart:convert';

import 'package:flutter_application_1/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = 'https://dummyjson.com/products';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    List<Product> productsList = [];

    for (var item in data['products']) {
      productsList.add(Product.fromJson(item));
    }

    return productsList;
  }
}
