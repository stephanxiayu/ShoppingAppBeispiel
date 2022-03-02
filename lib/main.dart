import 'package:flutter/material.dart';
import 'package:shopappfebruar/Screens/cart_screen.dart';
import 'package:shopappfebruar/Screens/product_detailscreen.dart';
import 'package:shopappfebruar/Screens/product_overview.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/provider/card.dart';
import 'package:shopappfebruar/provider/orders.dart';
import 'package:shopappfebruar/provider/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
 ChangeNotifierProvider.value(
          value: Orders(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
              CartScreen.routeName:((context) => const CartScreen()),
              
        },
      ),
    );
  }
}
