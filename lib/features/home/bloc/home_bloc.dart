import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yakishopingcart/data/cartitems.dart';
import 'package:yakishopingcart/data/productdata.dart';
import 'package:yakishopingcart/data/wishlistitems.dart';
import 'package:yakishopingcart/features/home/Model/productdatamodel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
    on<HomeWishlistButtonNavigationEvent>(homeWishlistButtonNavigationEvent);
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartitems.add(event.product);
    emit(HomeCartitemAddedActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlist.add(event.product);
    emit(HomeWishlistAddedActionState());
  }

  FutureOr<void> homeCartButtonNavigationEvent(
      HomeCartButtonNavigationEvent event, Emitter<HomeState> emit) {
    print("cart is pressed");
    emit(HomeNavigateCartPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigationEvent(
      HomeWishlistButtonNavigationEvent event, Emitter<HomeState> emit) {
    print("wishlist pressed");
    emit(HomeNavigateWishListPageActionState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitialState());

    await Future.delayed(Duration(seconds: 3));
    print("initial");
    emit(HomeSuccessState(
        productlist: Product.productList
            .map((e) => ProductModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }
}
