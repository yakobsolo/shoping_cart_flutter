part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitialState extends WishlistState {}

final class WishlistSuccessState extends WishlistState {
  final List<ProductModel> wishlist;

  WishlistSuccessState({required this.wishlist});
}
