import 'package:flutter/material.dart';
import 'package:my_shop_app/components/cart_item_view.dart';
import 'package:my_shop_app/data/models/cart_item.dart';
import 'package:my_shop_app/data/providers/cart_provider.dart';
import 'package:my_shop_app/data/providers/orders_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String route = '/cart';

  void addOrder(BuildContext context, CartProvider cartProvider,
      OrdersProvider ordersProvider) {
    ordersProvider.addOrder(
      cartProvider.cartItems.values.toList(),
      cartProvider.totalAmount,
    );
    cartProvider.clearCart();
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final OrdersProvider ordersProvider =
        Provider.of<OrdersProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '\$${cartProvider.totalAmount}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      addOrder(context, cartProvider, ordersProvider);
                    },
                    child: Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cartProvider.cartItemsList.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider<CartItem>.value(
                    builder: (context, _) => CartItemView(),
                    value: cartProvider.cartItemsList[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
