import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/product.dart';
import 'package:my_shop_app/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductListItemView extends StatelessWidget {
  void _openEditProduct(BuildContext context, String productId) {
    Navigator.of(context)
        .pushNamed(EditProductScreen.route, arguments: productId);
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);
    return ListTile(
      title: Text(product.title),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          _openEditProduct(context, product.id);
        },
      ),
    );
  }
}
