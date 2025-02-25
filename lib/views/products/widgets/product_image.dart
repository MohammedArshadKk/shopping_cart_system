import 'package:flutter/material.dart';
import 'package:shopping_cart_system/model/product_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[50]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Hero(
          tag: 'product-${product.id}',
          child: Image.network(product.image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
