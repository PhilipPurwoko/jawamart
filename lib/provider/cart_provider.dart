import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String clothId;
  final String title;
  final String imgUrl;
  final double price;
  int qty;

  Cart({
    @required this.id,
    @required this.clothId,
    @required this.title,
    @required this.imgUrl,
    @required this.qty,
    @required this.price,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cart = {};

  Map<String, Cart> get cart {
    return {..._cart};
  }

  int get itemCount {
    return _cart.length;
  }

  double get totalPrice {
    double total = 0;
    _cart.forEach((key, cloth) {
      total += cloth.price * cloth.qty;
    });
    return total;
  }

  void addToCart({
    String clothId,
    String title,
    String imgUrl,
    double price,
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

  void modifyQty(String clothId, bool add) {
    if (add) {
      _cart[clothId].qty += 1;
    } else {
      if (_cart[clothId].qty - 1 <= 0) {
        _cart.remove(clothId);
      } else {
        _cart[clothId].qty -= 1;
      }
    }
    notifyListeners();
  }
}
