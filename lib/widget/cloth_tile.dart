import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../provider/clothes_provider.dart';
import '../screen/add_cloth_screen.dart';

class ClothTile extends StatelessWidget {
  const ClothTile(this.cloth);

  final Cloth cloth;

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context);
    return ListTile(
      leading: Image.network(cloth.imgUrl),
      title: Text(cloth.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <IconButton>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AddClothScreen.routeName,
                  arguments: cloth,
                );
              },
            ),
            IconButton(
              color: Colors.red,
              icon: const Icon(Icons.delete),
              onPressed: () {
                clothesProvider.deleteCloth(cloth.id);
                cartProvider.removeFromCart(cloth.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
