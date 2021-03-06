import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/clothes_provider.dart';
import '../screen/add_cloth_screen.dart';
import '../widget/cloth_tile.dart';

class ManageClothesScreen extends StatelessWidget {
  static const String routeName = '/manage-clothes';

  @override
  Widget build(BuildContext context) {
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context);
    final List<Cloth> clothes = clothesProvider.clothes;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Clothes'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddClothScreen.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: clothes.isEmpty
            ? const Center(child: Text('Empty'))
            : ListView.separated(
                itemCount: clothes.length,
                separatorBuilder: (_, int i) => const Divider(),
                itemBuilder: (_, int index) => ClothTile(clothes[index]),
              ),
      ),
    );
  }
}
