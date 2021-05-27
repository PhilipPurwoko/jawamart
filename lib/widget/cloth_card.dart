import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/detail_screen.dart';
import '../provider/clothes_provider.dart';
import '../provider/cart_provider.dart';

class ClothCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    final Cloth cloth = Provider.of<Cloth>(context, listen: false);
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DetailScreen.routeName, arguments: cloth.id);
          },
          child: Image.network(
            cloth.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Cloth>(
            builder: (_, cloth, child) => IconButton(
              icon: Icon(
                  cloth.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                cloth.toggleFavorite();
                clothesProvider.refresh();
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              cartProvider.addToCart(
                productId: cloth.id,
                title: cloth.name,
                imgUrl: cloth.imgUrl,
                price: cloth.price,
              );
            },
          ),
          title: Text(
            cloth.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
