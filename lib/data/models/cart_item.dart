import 'package:flutter/foundation.dart';

class CartItem with ChangeNotifier {
  final String productId;
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.productId,
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}
