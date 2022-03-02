

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/provider/card.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.id,
required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  }) : super(key: key);
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(key: ValueKey(id),
    background: Container(color: Colors.red, child: const Icon(Icons.delete, size:30, color: Colors.grey),
    alignment: Alignment.centerRight,padding: const EdgeInsets.only(right: 20),
    
    ),
    direction:DismissDirection.endToStart ,onDismissed: (direction){
      Provider.of<Cart>(context).removeItem(productId);
    },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding:const EdgeInsets.all(8),
          child: ListTile(
              leading: CircleAvatar(
            child: FittedBox(child: Text('$price €')),
            
          ),
          title: Text(title),
          subtitle:Text('GesamtBetrag: ${price*quantity} €') ,
          trailing: Text('$quantity x'),
          
          
          ),
        ),
      ),
    );
  }
}
