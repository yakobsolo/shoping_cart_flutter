import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yakishopingcart/data/cartitems.dart';
import 'package:yakishopingcart/features/CartPage/bloc/cart_bloc.dart';
import 'package:yakishopingcart/features/CartPage/ui/cartTile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart item list"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successtate = state as CartSuccessState;

              return ListView.builder(
                  itemCount: successtate.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      product: successtate.cartItems[index],
                      cartBloc: cartBloc,
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
