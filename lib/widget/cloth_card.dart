import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cloth.dart';
import '../screen/detail_screen.dart';

class ClothCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cloth cloth = Provider.of<Cloth>(context, listen: false);
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
              },
            ),
          ),
          trailing: Consumer<Cloth>(
            builder: (_, cloth, child) => IconButton(
              icon: Icon(cloth.inCart
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined),
              onPressed: () {
                cloth.toogleCart();
              },
            ),
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
