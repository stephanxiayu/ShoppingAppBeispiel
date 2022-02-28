import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/provider/card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
static const routeName='/cart';
  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Card(margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                  Text('GesamtPreis'), 
                  SizedBox(width: 10,),
                  Chip(label: Text('\$${cart.totalAmount}'), backgroundColor:Colors.grey.shade900 ,)
              ],
            ),
          ),
        )
      ]),
    );
  }
}
