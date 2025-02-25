import 'package:flutter/material.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class ErrorWidgetData extends StatelessWidget {
  const ErrorWidgetData({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: TextStyle(fontSize: 20, color: AppColors.textPrimary),
        textAlign: TextAlign.center,
      ),
    );
  }
}
