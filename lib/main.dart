import 'package:flutter/material.dart';
import 'package:my_shop_app/screens/products_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepOrange,
      ),
      home: ProductsListScreen(),
    );
  }
}
