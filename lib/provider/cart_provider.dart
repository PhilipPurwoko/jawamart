import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int qty;
  final int price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.qty,
    @required this.price,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  int get totalPrice {
    int total = 0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.qty;
    });
    return total;
  }

  void addToCart(String productId, String title, int price) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (CartItem cart) => CartItem(
          id: cart.id,
          title: cart.title,
          price: cart.price,
          qty: cart.qty + 1,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }
}
