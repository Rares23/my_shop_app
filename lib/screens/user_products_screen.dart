import 'package:flutter/material.dart';
import 'package:my_shop_app/components/user_product_list_item_view.dart';
import 'package:my_shop_app/data/providers/products_provider.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const route = '/user-products';

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
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(8),
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
            )));
  }
}
