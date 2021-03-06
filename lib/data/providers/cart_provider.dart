import 'package:flutter/foundation.dart';
import 'package:my_shop_app/data/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  List<CartItem> get cartItemsList {
    return [...cartItems.values];
  }

  int get cartItemsQuantity {
    int count = 0;
    _cartItems.forEach((key, value) {
      count += value.quantity;
    });
    return count;
  }

  double get totalAmount {
    double total = 0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
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
          productId: productId,
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
          productId: productId,
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    }

    if (_cartItems[productId].quantity > 1) {
      _cartItems.update(
        productId,
        (existingItem) => CartItem(
          productId: productId,
          id: existingItem.id,
          price: existingItem.price,
          title: existingItem.title,
          quantity: existingItem.quantity - 1,
        ),
      );
    } else {
      _cartItems.remove(productId);
    }

    notifyListeners();
  }
}
