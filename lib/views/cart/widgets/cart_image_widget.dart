import 'package:flutter/material.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class CartImageWidget extends StatelessWidget {
  const CartImageWidget({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child:
          item.image.isNotEmpty
              ? Image.network(
                item.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: AppColors.background,
                    child: const Icon(
                      Icons.image,
                      color: AppColors.textSecondary,
                    ),
                  );
                },
              )
              : Container(
                width: 80,
                height: 80,
                color: AppColors.background,
                child: const Icon(Icons.image, color: AppColors.textSecondary),
              ),
    );
  }
}
