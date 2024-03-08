part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

final class WishlistInitialEvent extends WishlistEvent {}

final class WishlistRemoveEevnt extends WishlistEvent {
  final ProductModel wishlistitem;

  WishlistRemoveEevnt({required this.wishlistitem});
}
