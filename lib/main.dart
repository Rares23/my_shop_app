import 'package:flutter/material.dart';
import 'package:my_shop_app/data/providers/cart_provider.dart';
import 'package:my_shop_app/data/providers/orders_provider.dart';
import 'package:my_shop_app/data/providers/products_provider.dart';
import 'package:my_shop_app/screens/cart_screen.dart';
import 'package:my_shop_app/screens/create_product_screen.dart';
import 'package:my_shop_app/screens/edit_product_screen.dart';
import 'package:my_shop_app/screens/orders_screen.dart';
import 'package:my_shop_app/screens/product_details_screen.dart';
import 'package:my_shop_app/screens/products_list_screen.dart';
import 'package:my_shop_app/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
        ),
        home: ProductsListScreen(),
        routes: {
          ProductsListScreen.route: (contetx) => ProductsListScreen(),
          ProductDetailsScreen.route: (context) => ProductDetailsScreen(),
          CartScreen.route: (context) => CartScreen(),
          OrdersScreen.route: (context) => OrdersScreen(),
          UserProductsScreen.route: (context) => UserProductsScreen(),
          EditProductScreen.route: (context) => EditProductScreen(),
          CreateProductScreen.route: (context) => CreateProductScreen(),
        },
      ),
    );
  }
}
