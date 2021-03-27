import 'package:flutter/material.dart';
import 'package:my_shop_app/data/providers/products_provider.dart';
import 'package:my_shop_app/screens/product_details_screen.dart';
import 'package:my_shop_app/screens/products_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
        ),
        home: ProductsListScreen(),
        routes: {
          ProductsListScreen.route: (contetx) => ProductsListScreen(),
          ProductDetailsScreen.route: (context) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
