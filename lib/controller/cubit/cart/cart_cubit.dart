import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_cart_system/model/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<Product> productsCart = [];
  double totalAmount = 0;
  int count = 0;
  addtoCart(Product product) {
    try {
      if (!productsCart.contains(product)) {
        product.count += 1;
        productsCart.add(product);
      } else {
        product.count += 1;
      }

      emit(CartUpdated(products: productsCart, count: count));
    } catch (e) {
      log(e.toString());
    }
  }

  void removeFromCart(Product product) {
    try {
      productsCart.remove(product);
      emit(CartUpdated(products: productsCart));
    } catch (e) {
      log(e.toString());
    }
  }

  void calculateAmount(amount, Product product) {
    totalAmount += amount;
    product.count += 1;
    log(totalAmount.toString());
    emit(CartUpdated(products: productsCart, count: count, total: totalAmount));
  }

  void decrementQuantity(amount, Product product) {
    if (product.count > 0) {
      product.count -= 1;
    }

    if (totalAmount > 0) {
      totalAmount -= amount;
    }
    log(totalAmount.toString());
    emit(CartUpdated(products: productsCart, count: count, total: totalAmount));
  }

  void reset() {
    count = 0;
    totalAmount = 0;
    log(totalAmount.toString());
    emit(CartUpdated(products: productsCart, count: count, total: totalAmount));
  }
}
