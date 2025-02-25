import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:shopping_cart_system/controller/cubit/cart/cart_cubit.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/cart/cart_screen.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

class ActionsCartButtonWidget extends StatelessWidget {
  const ActionsCartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int cartCount = 0;
    List<Product> cartProducts = [];
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          cartCount = state.products.length;
          cartProducts.addAll(state.products);
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                getx.Get.to(
                  () => CartScreen(),
                  transition: getx.Transition.rightToLeft,
                  duration: Duration(milliseconds: 400),
                );
              },
            ),
            Positioned(
              top: 8,
              right: 8,
              child:
                  cartCount > 0
                      ? Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          cartCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      : Container(),
            ),
          ],
        );
      },
    );
  }
}
