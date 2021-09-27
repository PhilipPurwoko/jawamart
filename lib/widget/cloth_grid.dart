import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/clothes_provider.dart';
import 'cloth_card.dart';

class ClothGrid extends StatelessWidget {
  const ClothGrid({required this.isFavorite});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context);
    final List<Cloth> clothes =
        isFavorite ? clothesProvider.favClothes : clothesProvider.clothes;

    return clothes.isNotEmpty
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: clothes.length,
            itemBuilder: (_, int index) => ChangeNotifierProvider<Cloth>.value(
              value: clothes[index],
              child: ClothCard(),
            ),
          )
        : const Center(child: Text('Empty'));
  }
}
