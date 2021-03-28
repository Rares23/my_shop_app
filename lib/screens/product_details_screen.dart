import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/product.dart';
import 'package:my_shop_app/data/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String route = '/product';

  final String title = 'product';

  @override
  Widget build(BuildContext context) {
    final productId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['id'];

    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    final Product selectedProduct = productsProvider.getWhereId(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '\$${selectedProduct.price}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${selectedProduct.description}',
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
