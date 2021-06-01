import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';

class CartCard extends StatelessWidget {
  final Cart cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cart.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 34,
        ),
      ),
      onDismissed: (_) => Provider.of<CartProvider>(context, listen: false)
          .removeFromCart(cart.productId),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: <Widget>[
              Flexible(child: Image.network(cart.imgUrl)),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cart.title,
                        style: Theme.of(context).textTheme.headline6),
                    Text('Rp.${cart.price.toString()}'),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  Text(cart.qty.toString()),
                  IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
