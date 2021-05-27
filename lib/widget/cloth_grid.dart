import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cloth_card.dart';
import '../provider/clothes_provider.dart';

class ClothGrid extends StatelessWidget {
  final bool isFavorite;
  ClothGrid(this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context);
    final List<Cloth> clothes =
        isFavorite ? clothesProvider.favClothes : clothesProvider.clothes;

    return clothes.length > 0
        ? GridView.builder(
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
          )
        : Center(child: Text('Empty'));
  }
}
