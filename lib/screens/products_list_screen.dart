import 'package:flutter/material.dart';
import 'package:my_shop_app/components/products_grid_list.dart';

class ProductsListScreen extends StatelessWidget {
  static const String route = '/products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: ProductsGridList(),
    );
  }
}
