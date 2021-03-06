import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';

class CartCard extends StatelessWidget {
  const CartCard(this.cart);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Dismissible(
      key: ValueKey<String>(cart.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 34,
        ),
      ),
      onDismissed: (_) => cartProvider.removeFromCart(cart.clothId),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: <Widget>[
              Flexible(child: Image.network(cart.imgUrl)),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    Text(
                      cart.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text('Rp.${cart.price.toString()}'),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cartProvider.modifyQty(cart.clothId, isAdding: true);
                    },
                  ),
                  Text(cart.qty.toString()),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      cartProvider.modifyQty(cart.clothId, isAdding: false);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
