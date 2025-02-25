import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_cart_system/controller/api/fetch_product_data.dart';
import 'package:shopping_cart_system/model/product_model.dart';

part 'product_cubit_state.dart';

class ProductCubitCubit extends Cubit<ProductCubitState> {
  ProductCubitCubit() : super(ProductCubitInitial());
  fetchproductdataCubit() async {
    try {
      emit(LoadingState());
      final List<Product> products = await fetchProductData();
      if (products.isEmpty) {
        emit(NoDataState());
      } else {
        emit(DataLoadedState(products: products));
      }
    } catch (e) {
      log(e.toString());
      emit(ErrorState(error: e.toString()));
    }
  }
}
