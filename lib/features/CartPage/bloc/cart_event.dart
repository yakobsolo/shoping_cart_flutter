part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveItemsEvent extends CartEvent {
  final ProductModel cartitem;

  CartRemoveItemsEvent({required this.cartitem});
}
