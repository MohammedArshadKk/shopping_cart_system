import 'package:flutter/material.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/products/products_screen.dart';
import 'package:shopping_cart_system/views/products/widgets/catogory_widget.dart';
import 'package:shopping_cart_system/views/products/widgets/product_details.dart';
import 'package:shopping_cart_system/views/products/widgets/product_image.dart';
import 'package:shopping_cart_system/views/products/widgets/wishlist_button.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                fit: StackFit.expand,
                children: [
                 ProductImage(product: product),
                  CatogoryWidget(product: product),
                  WishlistButton(),
                ],
              ),
            ),

            ProductDetails(product: product),
          ],
        ),
      ),
    );
  }
}
