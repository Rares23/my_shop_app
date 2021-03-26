import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String route = '/product';

  final String title = 'product';

  @override
  Widget build(BuildContext context) {
    final productId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
