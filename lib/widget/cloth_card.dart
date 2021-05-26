import 'package:flutter/material.dart';
import '../screen/detail_screen.dart';

class ClothCard extends StatelessWidget {
  final String id;
  final String name;
  final String imgUrl;

  ClothCard({
    @required this.id,
    @required this.name,
    @required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DetailScreen.routeName, arguments: id);
          },
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Icon(Icons.favorite),
          trailing: Icon(Icons.shopping_cart),
          title: Text(
            name,
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
