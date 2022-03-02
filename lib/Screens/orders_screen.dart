

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/provider/orders.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final orderDate=Provider.of<Orders>(context);
    return Scaffold(appBar: AppBar(title: Text('Deine Bestellung')),
      body: ListView.builder(itemCount: orderDate.orders.length,
        itemBuilder: (context, i)),
    );
  }
}