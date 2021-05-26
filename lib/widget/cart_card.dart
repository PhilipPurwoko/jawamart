import 'package:flutter/material.dart';
import '../provider/cart_provider.dart';

class CartCard extends StatelessWidget {
  final CartItem cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Text>[
            Text(cart.title),
            Text('Rp.${cart.price.toString()}'),
            Text('x${cart.qty.toString()}'),
          ],
        ),
      ),
    );
  }
}
