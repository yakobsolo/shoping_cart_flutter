import 'package:flutter/material.dart';
import 'package:yakishopingcart/data/productdata.dart';
import 'package:yakishopingcart/features/CartPage/bloc/cart_bloc.dart';
import 'package:yakishopingcart/features/home/Model/productdatamodel.dart';
import 'package:yakishopingcart/features/home/bloc/home_bloc.dart';

class CartTile extends StatelessWidget {
  final ProductModel product;
  final CartBloc cartBloc;
  const CartTile({super.key, required this.product, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    print("hey");
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Image(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(product.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$  " + product.price.toString(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          cartBloc.add(CartRemoveItemsEvent(cartitem: product));
                        },
                        icon: Icon(Icons.delete_outline)),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
