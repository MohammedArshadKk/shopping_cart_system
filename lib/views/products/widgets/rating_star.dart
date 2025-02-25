import 'package:flutter/material.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;

  const RatingStars({super.key, required this.rating, this.size = 16});

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