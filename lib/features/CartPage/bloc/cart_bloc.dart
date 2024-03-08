import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yakishopingcart/data/cartitems.dart';
import 'package:yakishopingcart/features/home/Model/productdatamodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveItemsEvent>(cartRemoveItemsEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartitems));
  }

  FutureOr<void> cartRemoveItemsEvent(
      CartRemoveItemsEvent event, Emitter<CartState> emit) {
    cartitems.remove(event.cartitem);
    emit(CartSuccessState(cartItems: cartitems));
  }
}
