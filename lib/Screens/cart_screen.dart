import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/provider/card.dart' show Cart;
import '../Widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
static const routeName='/cart';
  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Card(margin:const EdgeInsets.all(15),
          child: Padding(
            padding:const EdgeInsets.all(15),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const  Text('GesamtPreis'), 
         const     Spacer(),
                  Chip(label: Text('\$${cart.totalAmount}'), backgroundColor:Colors.grey.shade900 ,), 
                 TextButton(onPressed: (){}, child:const Text(' Bestellen!'))
              ],
            ),
          ),
        ), 
      const  SizedBox(height: 10,)
      ,
      Expanded(child: ListView.builder(itemCount: cart.itemCount,itemBuilder: (context, i)=> CartItem(id: cart.items.values.toList()[i].id, title: cart.items.values.toList()[i].title, quantity: cart.items.values.toList()[i].quantity, price: cart.items.values.toList()[i].price),))
      ]),
    );
  }
}
