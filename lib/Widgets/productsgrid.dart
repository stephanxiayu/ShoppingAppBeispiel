
import 'package:flutter/material.dart';
import 'package:shopappfebruar/Widgets/product_item.dart';

import 'package:provider/provider.dart';
import 'package:shopappfebruar/provider/products.dart';

class ProductsGrid extends StatelessWidget {

final bool showFavs;



  const ProductsGrid({Key? key,required this.showFavs}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
   final productsData= Provider.of<Products>(context);
   final products= showFavs? productsData.favoriteItems: productsData.items;
   return GridView.builder(
      itemCount: products.length,
      itemBuilder: (context, i) =>ChangeNotifierProvider.value(value: products[i], child:const ProductItem(
          ),),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10),
      padding: const EdgeInsets.all(10), 
    );
  }
}

