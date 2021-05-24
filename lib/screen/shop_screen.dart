import 'package:flutter/material.dart';
import '../model/cloth.dart';
import '../widget/cloth_card.dart';

class ShopScreen extends StatelessWidget {
  static final String routeName = '/shop';

  final List<Cloth> clothes = Cloth.clothes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jawa Mart'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: clothes.length,
          itemBuilder: (_, index) => ClothCard(clothes[index]),
        ),
      ),
    );
  }
}
