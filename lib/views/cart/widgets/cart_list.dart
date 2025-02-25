import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_system/controller/cubit/cart/cart_cubit.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/cart/widgets/cart_Item_details.dart';
import 'package:shopping_cart_system/views/cart/widgets/cart_image_widget.dart';
import 'package:shopping_cart_system/views/cart/widgets/delete.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartItems, required this.count});
  final List<Product> cartItems;
  final int count;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cartItems.length,
      itemBuilder: (ctx, index) {
        final item = cartItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ], 
            ),
            child: Padding( 
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartImageWidget(item: item),
                  const SizedBox(width: 16),
                  CartItemDetails(item: item, ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
