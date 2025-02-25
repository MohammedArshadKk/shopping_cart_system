import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_system/controller/cubit/cart/cart_cubit.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/cart/widgets/cart_Item_details.dart';
import 'package:shopping_cart_system/views/cart/widgets/cart_image_widget.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class Delete extends StatelessWidget {
  const Delete({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: () {
        context.read<CartCubit>().removeFromCart(item);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white, size: 24),
      ),
    );
  }
}
