import 'package:flutter/material.dart';
import '../model/cloth.dart';

class ShopScreen extends StatelessWidget {
  static final String routeName = '/shop';

  final List<Cloth> clothes = [
    Cloth(
      id: '123',
      name: 'Kaos',
      imgUrl:
          'https://cdn.pixabay.com/photo/2014/08/26/21/48/shirts-428600_960_720.jpg',
      price: 50000,
      size: [Size.L, Size.XL],
    ),
    Cloth(
      id: '456',
      name: 'Celana',
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/01/19/14/45/person-1148941_960_720.jpg',
      price: 50000,
      size: [Size.S, Size.M, Size.L],
    ),
  ];

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
          itemBuilder: (_, index) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: Image.network(
                clothes[index].imgUrl,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: Icon(Icons.favorite),
                trailing: Icon(Icons.shopping_cart),
                title: Text(
                  clothes[index].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
