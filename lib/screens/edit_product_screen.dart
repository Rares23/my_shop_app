import 'package:flutter/material.dart';
import 'package:my_shop_app/components/product_form.dart';

class EditProductScreen extends StatelessWidget {
  static const String route = '/product/edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: ProductForm(),
    );
  }
}
