import 'package:flutter/material.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No data',
        style: TextStyle(fontSize: 20, color: AppColors.textPrimary),
      ),
    );
  }
}
