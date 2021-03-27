import 'package:flutter/material.dart';
import 'package:my_shop_app/components/products_grid_list.dart';
import 'package:my_shop_app/data/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsListScreen extends StatelessWidget {
  static const String route = '/products';

  void changeShowFavoritesFilter(
      ProductsProvider productsProvider, bool onlyFavorites) {
    productsProvider.filterByFavorites(onlyFavorites);
  }

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (int selectedValue) {
              changeShowFavoritesFilter(productsProvider, selectedValue == 0);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favorites'), value: 0),
              PopupMenuItem(child: Text('Show All'), value: 1)
            ],
          ),
        ],
      ),
      body: ProductsGridList(),
    );
  }
}
