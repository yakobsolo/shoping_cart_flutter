import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yakishopingcart/data/wishlistitems.dart';
import 'package:yakishopingcart/features/home/Model/productdatamodel.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveEevnt>(wishlistRemoveEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlist: wishlist));
  }

  FutureOr<void> wishlistRemoveEvent(
      WishlistRemoveEevnt event, Emitter<WishlistState> emit) {
    wishlist.remove(event.wishlistitem);
    emit(WishlistSuccessState(wishlist: wishlist));
  }
}
