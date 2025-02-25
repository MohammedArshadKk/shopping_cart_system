import 'package:flutter/material.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class WishlistButton extends StatelessWidget {
  const WishlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.favorite_outline_rounded, size: 16),
          color: AppColors.accent,
          padding: EdgeInsets.zero,
          onPressed: () {},
        ),
      ),
    );
  }
}
