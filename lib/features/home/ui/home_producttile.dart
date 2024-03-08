import 'package:flutter/material.dart';
import 'package:yakishopingcart/data/productdata.dart';
import 'package:yakishopingcart/features/home/Model/productdatamodel.dart';
import 'package:yakishopingcart/features/home/bloc/home_bloc.dart';

class Producttile extends StatelessWidget {
  final ProductModel product;
  final HomeBloc homeBloc;
  const Producttile({super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
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
                          homeBloc.add(HomeProductWishlistButtonClickedEvent(product: product));
                        },
                        icon: Icon(Icons.favorite_outline)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductCartButtonClickedEvent(product: product));
                        },
                        icon: Icon(Icons.shopping_bag_outlined)),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
