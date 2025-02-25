part of 'product_cubit_cubit.dart';

@immutable
sealed class ProductCubitState {}

final class ProductCubitInitial extends ProductCubitState {}

class LoadingState extends ProductCubitState {}

class DataLoadedState extends ProductCubitState {
  final List<Product> products;

  DataLoadedState({required this.products}); 
}

class NoDataState extends ProductCubitState {}

class ErrorState extends ProductCubitState {
  final String error;

  ErrorState({required this.error});
}
