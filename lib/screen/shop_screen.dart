import 'package:flutter/material.dart';
import '../widget/cloth_grid.dart';

class ShopScreen extends StatelessWidget {
  static const String routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ClothGrid(isFavorite: false),
    );
  }
}
