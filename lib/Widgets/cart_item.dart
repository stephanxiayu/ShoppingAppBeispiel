

import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  }) : super(key: key);
  final String id;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
