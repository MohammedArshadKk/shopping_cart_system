import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopping_cart_system/model/product_model.dart';

Future<List<Product>> fetchProductData() async {
  const String url = 'https://fakestoreapi.com/products';
  final Dio dio = Dio();
  final Response response = await dio.get(url);
  if (response.statusCode == 200) {
    final List<dynamic> products = response.data;
    final List<Product> productList =
        products
            .map((data) => Product.fromJson(data as Map<String, dynamic>))
            .toList();
    return productList;
  } else {
    log('some error happend : status code ${response.statusCode}');
    return [];
  }
}
