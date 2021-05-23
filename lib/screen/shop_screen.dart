import 'package:flutter/material.dart';
import '../model/cloth.dart';

class ShopScreen extends StatelessWidget {
  static final String routeName = '/shop';

  final List<Cloth> clothes = [
    Cloth(
      name: 'Kaos',
      imgUrl: 'assets/images.jpg',
      price: 50000,
      size: [Size.L, Size.XL],
    ),
    Cloth(
      name: 'Celana',
      imgUrl: 'assets/images.jpg',
      price: 50000,
      size: [Size.S, Size.M, Size.L],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jawa Mart'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) => GridTile(
          child: Image.asset(clothes[index].imgUrl),
          footer: Text(clothes[index].name),
        ),
      ),
    );
  }
}
