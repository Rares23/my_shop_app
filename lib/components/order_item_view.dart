import 'package:flutter/material.dart';
import 'package:my_shop_app/data/models/order.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrderItemView extends StatefulWidget {
  @override
  _OrderItemViewState createState() => _OrderItemViewState();
}

class _OrderItemViewState extends State<OrderItemView> {
  bool _isExpanded = false;

  void toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Order order = Provider.of<Order>(context);
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(
                '\$${order.amount}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
                onPressed: toggleExpand,
              ),
            ),
          ),
          if (_isExpanded)
            Column(
              children: [
                ...order.products
                    .map(
                      (e) => ListTile(
                        title: Text(e.title),
                        subtitle: Text('Q: ${e.quantity} | \$${e.price}'),
                        trailing: Text('${e.quantity * e.price}'),
                      ),
                    )
                    .toList()
              ],
            ),
        ],
      ),
    );
  }
}
