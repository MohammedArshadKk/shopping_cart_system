import 'package:flutter/material.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/products/widgets/product_card.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.64,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
