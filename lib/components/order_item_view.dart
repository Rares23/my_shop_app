import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/order.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrderItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Order order = Provider.of<Order>(context);
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
