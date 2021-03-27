import 'package:flutter/material.dart';
import 'package:my_shop_app/components/badge.dart';
import 'package:my_shop_app/components/products_grid_list.dart';
import 'package:my_shop_app/data/providers/cart_provider.dart';
import 'package:my_shop_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';

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

  void openCartScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CartScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) => Badge(
              child: child,
              value: cartProvider.cartItemsQuantity.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                openCartScreen(context);
              },
            ),
          ),
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
