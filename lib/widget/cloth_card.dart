import 'package:flutter/material.dart';
import '../screen/detail_screen.dart';
import '../model/cloth.dart';

class ClothCard extends StatelessWidget {
  final Cloth cloth;
  ClothCard(this.cloth);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DetailScreen.routeName, arguments: cloth);
          },
          child: Image.network(
            cloth.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Icon(Icons.favorite),
          trailing: Icon(Icons.shopping_cart),
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
