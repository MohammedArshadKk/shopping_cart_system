import 'package:flutter/material.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/products/widgets/actions_cart_button_widget.dart';
import 'package:shopping_cart_system/views/products/widgets/product_card.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: 1,
        title: "Fjallraven - Foldsack No. 1 Backpack",
        price: 109.95,
        description:
            "Your perfect pack for everyday use and walks in the forest.",
        category: "Men's Clothing",
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        rating: 3.9,
        ratingCount: 120,
      ),
      Product(
        id: 2,
        title: "Mens Casual Premium Slim Fit T-Shirts",
        price: 22.3,
        description: "Slim-fitting style, contrast raglan long sleeve.",
        category: "Men's Clothing",
        image:
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        rating: 4.1,
        ratingCount: 259,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ActionsCartButtonWidget(),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
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
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.favorite, color: AppColors.background),
      ),
    );
  }
}



class RatingStars extends StatelessWidget {
  final double rating;
  final double size;

  const RatingStars({Key? key, required this.rating, this.size = 16})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(
            Icons.star_rounded,
            color: AppColors.starYellow,
            size: size,
          );
        } else if (index == rating.floor() && rating % 1 > 0) {
          return Icon(
            Icons.star_half_rounded,
            color: AppColors.starYellow,
            size: size,
          );
        } else {
          return Icon(
            Icons.star_border_rounded,
            color: AppColors.starYellow,
            size: size,
          );
        }
      }),
    );
  }
}
