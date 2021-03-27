import 'package:flutter/material.dart';
import 'package:my_shop_app/data/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(6),
            child: Row(
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Chip(
                  label: Consumer<CartProvider>(
                    builder: (context, cartProvider, child) => Text(
                      cartProvider.totalAmount.toString(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
