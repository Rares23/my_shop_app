import 'package:flutter/material.dart';
import 'package:my_shop_app/components/user_product_list_item_view.dart';
import 'package:my_shop_app/data/providers/products_provider.dart';
import 'package:my_shop_app/screens/create_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const route = '/user-products';

  void _openCreateProductScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CreateProductScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _openCreateProductScreen(context);
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: productsProvider.products.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: productsProvider.products[index],
              builder: (context, child) {
                return UserProductListItemView();
              },
            );
          },
        ),
      ),
    );
  }
}
