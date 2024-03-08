part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel product;

  HomeProductCartButtonClickedEvent({required this.product});
}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductModel product;

  HomeProductWishlistButtonClickedEvent({required this.product});
}

class HomeWishlistButtonNavigationEvent extends HomeEvent {}

class HomeCartButtonNavigationEvent extends HomeEvent {}
