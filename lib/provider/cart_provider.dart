import 'package:flutter/material.dart';

class Cart {
  Cart({
    required this.id,
    required this.clothId,
    required this.title,
    required this.imgUrl,
    required this.qty,
    required this.price,
  });

  final String id;
  final String clothId;
  final String title;
  final String imgUrl;
  final double price;
  int qty;
}

class CartProvider with ChangeNotifier {
  final Map<String, Cart> _cart = <String, Cart>{};

  Map<String, Cart> get cart => _cart;
  int get itemCount => _cart.length;

  double get totalPrice => _cart.values
      .map((Cart cart) => cart.price)
      .reduce((double a, double b) => a + b);

  void addToCart({
    required String clothId,
    required String title,
    required String imgUrl,
    required double price,
  }) {
    if (_cart.containsKey(clothId)) {
      _cart.update(
        clothId,
        (Cart cart) => Cart(
          id: cart.id,
          clothId: clothId,
          title: cart.title,
          imgUrl: cart.imgUrl,
          price: cart.price,
          qty: cart.qty + 1,
        ),
      );
    } else {
      _cart.putIfAbsent(
        clothId,
        () => Cart(
          id: DateTime.now().toString(),
          title: title,
          clothId: clothId,
          imgUrl: imgUrl,
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    if (_cart.keys.contains(id)) {
      _cart.remove(id);
      notifyListeners();
    }
  }

  void modifyQty(String clothId, {required bool isAdding}) {
    if (_cart[clothId] != null) {
      if (isAdding) {
        _cart[clothId]!.qty += 1;
      } else {
        if (_cart[clothId]!.qty - 1 <= 0) {
          _cart.remove(clothId);
        } else {
          _cart[clothId]!.qty -= 1;
        }
      }
      notifyListeners();
    }
  }
}
