import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_system/controller/cubit/cart/cart_cubit.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/cart/widgets/cart_list.dart';
import 'package:shopping_cart_system/views/cart/widgets/cart_no_data_widget.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _proceedToCheckout() {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Checkout'),
            content: Text(
              'Proceeding to checkout with total amount: \$${'totalAmount.toStringAsFixed(2)'}',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<CartCubit>().reset();

                  Navigator.of(ctx).pop();
                },
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final List<Product> cartItems =
              state is CartUpdated ? state.products : [];
          double total = state is CartUpdated ? state.total : 0;
          int count = state is CartUpdated ? state.count : 0;

          return cartItems.isEmpty
              ? CartNoDataWidget()
              : Column(
                children: [
                  Expanded(child: CartList(cartItems: cartItems, count: count)),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                total.toStringAsFixed(2),
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _proceedToCheckout,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accent,
                                foregroundColor: AppColors.buttonText,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'CHECKOUT',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
