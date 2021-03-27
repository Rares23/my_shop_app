import 'package:flutter/foundation.dart';
import 'package:my_shop_app/data/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems;

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          price: existingItem.price,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }
}
