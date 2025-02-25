import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_system/controller/cubit/cart/cart_cubit.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class CartItemDetails extends StatefulWidget {
  const CartItemDetails({super.key, required this.item});
  final Product item;

  @override
  State<CartItemDetails> createState() => _CartItemDetailsState();
}

class _CartItemDetailsState extends State<CartItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '\$${widget.item.price.toStringAsFixed(2)}',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              // Quantity selector
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.divider),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<CartCubit>().decrementQuantity(
                          widget.item.price,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        int count = state is CartUpdated ? state.count : 0;
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            count.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      onTap:
                          () => {
                            context.read<CartCubit>().calculateAmount(
                              widget.item.price,
                            ),
                            setState(() {}),
                          },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              IconButton(
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20,
                ),
                onPressed: () {
                  context.read<CartCubit>().removeFromCart(widget.item);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
