import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yakishopingcart/data/wishlistitems.dart';
import 'package:yakishopingcart/features/CartPage/bloc/cart_bloc.dart';
import 'package:yakishopingcart/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:yakishopingcart/features/wishlist/ui/wishlistTilepage.dart';

class WishlistPage extends StatefulWidget {
   WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();

    @override
    void initState() {
      // TODO: implement initState
      super.initState();

      wishlistBloc.add(WishlistInitialEvent());
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Cart item list"),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successtate = state as WishlistSuccessState;

                return ListView.builder(
                    itemCount: successtate.wishlist.length,
                    itemBuilder: (context, index) {
                      return WishlistTile(
                        product: successtate.wishlist[index],
                        wishlistBloc: wishlistBloc,
                      );
                    });

                break;
              default:
                return Container();
            }
          },
          listener: (context, state) {},
        ),
      );
  }
}