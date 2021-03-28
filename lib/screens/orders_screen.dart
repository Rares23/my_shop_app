import 'package:flutter/material.dart';
import 'package:my_shop_app/components/order_item_view.dart';
import 'package:my_shop_app/data/models/order.dart';
import 'package:my_shop_app/data/providers/orders_provider.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const String route = '/orders';

  @override
  Widget build(BuildContext context) {
    final OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: ordersProvider.orders.length,
          itemBuilder: (context, index) => ChangeNotifierProvider<Order>.value(
            value: ordersProvider.orders[index],
            builder: (context, cartItem) {
              return OrderItemView();
            },
          ),
        ),
      ),
    );
  }
}
