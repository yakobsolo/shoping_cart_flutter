part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitialState extends CartState {}

final class CartSuccessState extends CartState {
  final List<ProductModel> cartItems;

  CartSuccessState({required this.cartItems});
}
