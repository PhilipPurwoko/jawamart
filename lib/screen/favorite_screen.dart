import 'package:flutter/material.dart';
import '../widget/cloth_grid.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ClothGrid(true),
    );
  }
}
