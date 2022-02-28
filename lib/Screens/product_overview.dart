import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/Screens/cart_screen.dart';
import 'package:shopappfebruar/Widgets/badge.dart';
import 'package:shopappfebruar/Widgets/productsgrid.dart';
import 'package:shopappfebruar/provider/card.dart';
import 'package:shopappfebruar/provider/products.dart';

enum FilterOtions {
  Favorites,
  All,
  
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {

  var _showOnlyFavorites=false;
  @override
  Widget build(BuildContext context) {
final cart=Provider.of<Cart>(context, );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('shop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOtions selectedValue) {
           setState(() {
                  if(selectedValue==FilterOtions.Favorites){
                
_showOnlyFavorites=true;
                }else{_showOnlyFavorites=false;}
           });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Deine Favoriten'),
                      value: FilterOtions.Favorites,
                    ),
                    const PopupMenuItem(
                      child: Text('Alle'),
                      value: FilterOtions.All,
                    ),
                   
                    
                  ]), 
                  
                  Badge(child: IconButton(onPressed: (){
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  }, icon:const Icon(Icons.shopping_cart)), value: cart.itemCount.toString(), color: Colors.red)
        ],
      ),
      body:  ProductsGrid(showFavs: _showOnlyFavorites,),
    );
  }
}
