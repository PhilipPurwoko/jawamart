import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String productId;
  final String title;
  final String imgUrl;
  final int qty;
  final int price;

  Cart({
    @required this.id,
    @required this.productId,
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

  int get totalPrice {
    int total = 0;
    _cart.forEach((key, cloth) {
      total += cloth.price * cloth.qty;
    });
    return total;
  }

  void addToCart({
    String productId,
    String title,
    String imgUrl,
    int price,
  }) {
    if (_cart.containsKey(productId)) {
      _cart.update(
        productId,
        (Cart cart) => Cart(
          id: cart.id,
          productId: productId,
          title: cart.title,
          imgUrl: cart.imgUrl,
          price: cart.price,
          qty: cart.qty + 1,
        ),
      );
    } else {
      _cart.putIfAbsent(
        productId,
        () => Cart(
          id: DateTime.now().toString(),
          title: title,
          productId: productId,
          imgUrl: imgUrl,
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    _cart.remove(id);
    notifyListeners();
  }
}
