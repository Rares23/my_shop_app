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

    final productsProvider = Provider.of<ProductsProvider>(context);
    final Product selectedProduct = productsProvider.getWhereId(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
      ),
    );
  }
}
