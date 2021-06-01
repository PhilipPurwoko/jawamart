import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/add_cloth_screen.dart';
import '../provider/clothes_provider.dart';
import '../provider/cart_provider.dart';

class ManageClothesScreen extends StatelessWidget {
  static final String routeName = '/manage-clothes';

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
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
        child: clothes.length < 1
            ? Center(child: const Text('Empty'))
            : ListView.separated(
                itemCount: clothes.length,
                separatorBuilder: (_, int i) => Divider(),
                itemBuilder: (_, int index) => ListTile(
                  leading: Image.network(clothes[index].imgUrl),
                  title: Text(clothes[index].name),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <IconButton>[
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Colors.red,
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            clothesProvider.deleteCloth(clothes[index].id);
                            cartProvider.removeFromCart(clothes[index].id);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
