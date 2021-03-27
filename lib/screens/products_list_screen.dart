import 'package:flutter/material.dart';
import 'package:my_shop_app/components/products_grid_list.dart';

class ProductsListScreen extends StatefulWidget {
  static const String route = '/products';

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  bool _showOnlyFavorites = false;

  void changeShowFavoritesFilter(bool onlyFavorites) {
    setState(() {
      _showOnlyFavorites = onlyFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (int selectedValue) {
              changeShowFavoritesFilter(selectedValue == 0);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favorites'), value: 0),
              PopupMenuItem(child: Text('Show All'), value: 1)
            ],
          ),
        ],
      ),
      body: ProductsGridList(
        showOnlyFavorites: _showOnlyFavorites,
      ),
    );
  }
}
