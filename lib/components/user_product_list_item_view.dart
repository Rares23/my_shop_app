import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/product.dart';
import 'package:provider/provider.dart';

class UserProductListItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);
    return ListTile(
      title: Text(product.title),
    );
  }
}
