import 'package:flutter/material.dart';

class CreateProductScreen extends StatelessWidget {
  static const String route = '/product/create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
    );
  }
}
