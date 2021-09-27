import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../widget/cart_card.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final List<Cart> cart = cartProvider.cart.values.toList();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Total Price'),
                Text('Rp.${cartProvider.totalPrice.toString()}'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Checkout'),
                )
              ],
            ),
          ),
          if (cart.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.itemCount,
                itemBuilder: (_, int index) => CartCard(cart[index]),
              ),
            )
          else
            const Text('No Item')
        ],
      ),
    );
  }
}
