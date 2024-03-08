import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yakishopingcart/data/productdata.dart';
import 'package:yakishopingcart/features/CartPage/ui/cartpage.dart';
import 'package:yakishopingcart/features/home/bloc/home_bloc.dart';
import 'package:yakishopingcart/features/home/ui/home_producttile.dart';
import 'package:yakishopingcart/features/wishlist/ui/wishlistpage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState

    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "shopping cart",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          // TODO: implement listener

          if (state is HomeNavigateCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          } else if (state is HomeNavigateWishListPageActionState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WishlistPage()));
          } else if (state is HomeWishlistAddedActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Wishlist Added")));
          } else if (state is HomeCartitemAddedActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Cartitem Added")));
          } 
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeInitialState:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            case HomeSuccessState:
              final successstate = state as HomeSuccessState;
              return Scaffold(
                // backgroundColor: Colors.blue,
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text("yakis shopping cart"),
                  actions: [
                    GestureDetector(
                        onTap: () {
                          homeBloc.add(HomeWishlistButtonNavigationEvent());
                        },
                        child: Icon(
                          Icons.favorite_outline,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          homeBloc.add(HomeCartButtonNavigationEvent());
                        },
                        child: Icon(Icons.shopping_bag_outlined)),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),

                body: ListView.builder(
                    itemCount: successstate.productlist.length,
                    itemBuilder: (context, index) {
                      return Producttile(
                        product: successstate.productlist[index],
                        homeBloc: homeBloc,
                      );
                    }),
              );

            case HomeErrorState:
              return Scaffold(
                body: Center(child: Text("Error")),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
