part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class LoadingState extends CartState {}

class NodataState extends CartState {}



class CartUpdated extends CartState {
  final List<Product> products;
final double total;
  final int count;
  CartUpdated({required this.products, this.total=0, this.count=0});
}
