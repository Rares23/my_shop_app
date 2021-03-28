import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/cart_item.dart';
import 'package:my_shop_app/data/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItemView extends StatelessWidget {
  void addQuantityItem() {}

  void removeQuantityItem() {}

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItem>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to remove the item from the cart?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes'),
                  ),
                ],
              );
            });
      },
      onDismissed: (DismissDirection direction) {
        cartProvider.removeItem(cartItem.productId);
      },
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
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
      ),
    );
  }
}
