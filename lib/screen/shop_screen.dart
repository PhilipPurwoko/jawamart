import 'package:flutter/material.dart';
import '../widget/cloth_grid.dart';

class ShopScreen extends StatelessWidget {
  static final String routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ClothGrid(false),
    );
  }
}
