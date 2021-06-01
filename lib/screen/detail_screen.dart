import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/clothes_provider.dart';
import '../provider/cart_provider.dart';
import '../widget/available_size.dart';

class DetailScreen extends StatefulWidget {
  static final String routeName = '/detail';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    String clothId = ModalRoute.of(context).settings.arguments as String;
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context);
    final Cloth cloth = clothesProvider.findById(clothId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: [
          IconButton(
            icon:
                Icon(cloth.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              cloth.toggleFavorite();
              clothesProvider.refresh();
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              cartProvider.addToCart(
                productId: cloth.id,
                title: cloth.name,
                imgUrl: cloth.imgUrl,
                price: cloth.price,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(cloth.imgUrl),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cloth.name.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    'Rp. ${cloth.price.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(cloth.desc),
            ),
            AvailableSize(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  cartProvider.addToCart(
                    productId: cloth.id,
                    title: cloth.name,
                    imgUrl: cloth.imgUrl,
                    price: cloth.price,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_shopping_cart),
                    const Text('Add to Cart'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
