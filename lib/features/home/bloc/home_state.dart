part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ProductModel> productlist;

  HomeSuccessState({required this.productlist});
}

class HomeNavigateWishListPageActionState extends HomeActionState {}

class HomeErrorState extends HomeState {}

class HomeNavigateCartPageActionState extends HomeActionState {}

class HomeInitialState extends HomeState {}

class HomeWishlistAddedActionState extends HomeActionState {}

class HomeCartitemAddedActionState extends HomeActionState {}

