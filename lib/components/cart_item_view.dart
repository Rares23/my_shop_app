import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/cart_item.dart';
import 'package:provider/provider.dart';

class CartItemView extends StatelessWidget {
  void addQuantityItem() {}

  void removeQuantityItem() {}

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItem>(context, listen: false);

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
            leading: Chip(
              label: Text(
                '\$${cartItem.price}',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            title: Text('${cartItem.title}'),
            subtitle: Text('Total \$${cartItem.quantity * cartItem.price}'),
            trailing: Text('${cartItem.quantity}X')),
      ),
    );
  }
}
