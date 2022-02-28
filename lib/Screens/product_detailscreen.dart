

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/provider/products.dart';

class ProductDetailsScreen extends StatelessWidget {




  const ProductDetailsScreen({ Key? key, }) : super(key: key);
static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context)!.settings.arguments as String;
 final loadedProduct= Provider.of<Products>(context, listen:false ).findById(productId);

 
    
    return Scaffold( appBar: AppBar(
        centerTitle: true,
        title:  Text(loadedProduct.title),
      ),
    
      
    );
  }
}