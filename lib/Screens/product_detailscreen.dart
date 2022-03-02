import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappfebruar/provider/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 30,
            width: double.infinity,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${loadedProduct.price} €',
            style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ))
        ],
      )),
    );
  }
}
