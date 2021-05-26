import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cloth_card.dart';
import '../provider/clothes_provider.dart';

class ClothGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context);
    final List<Cloth> clothes = clothesProvider.clothes;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: clothes.length,
      itemBuilder: (_, int index) => ChangeNotifierProvider.value(
        value: clothes[index],
        child: ClothCard(),
      ),
    );
  }
}
