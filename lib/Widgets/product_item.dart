import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/Screens/product_detailscreen.dart';
import 'package:shopappfebruar/provider/card.dart';
import 'package:shopappfebruar/provider/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  // final String id;
  // final String title;
//  final String imageUrl;

//  const ProductItem(
  //     {Key? key, required this.id, required this.imageUrl, required this.title})
  //    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart=Provider.of<Cart>(context, listen: false);
    return  ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: (() {
                    Navigator.of(context).pushNamed(
                        ProductDetailsScreen.routeName,
                        arguments: product.id);
                  }),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    leading:Consumer<Product>(
        builder: (context, product, child) => IconButton(
                      icon: Icon(
                        product.isFavorite!
                            ? Icons.favorite 
                            : Icons.favorite_border,
                        size: 14,
                      ),
                      onPressed: () {
                        product.toggleFavoriteStatus();
                      },
                    ),),
                    trailing: IconButton(
                      onPressed: () {
cart.addItem(product.id, product.price, product.title, 1);

                      },
                      icon: Icon(
                        Icons.shop_2,
                        color: Colors.greenAccent.shade700,
                        size: 14,
                      ),
                    ),
                    title: Text(
                      product.title,
                    )),
              ),
            );
  }
}
