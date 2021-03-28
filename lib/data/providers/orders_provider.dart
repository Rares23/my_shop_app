import 'package:flutter/foundation.dart';
import 'package:my_shop_app/data/models/cart_item.dart';
import 'package:my_shop_app/data/models/order.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartItems,
      ),
    );
    notifyListeners();
  }
}
