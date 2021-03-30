import 'package:flutter/material.dart';
import 'package:my_shop_app/components/product_form.dart';

class CreateProductScreen extends StatelessWidget {
  static const String route = '/product/create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: ProductForm(),
    );
  }
}
