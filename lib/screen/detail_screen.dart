import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/clothes_provider.dart';
import '../model/cloth.dart';

class DetailScreen extends StatelessWidget {
  static final String routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    String clothId = ModalRoute.of(context).settings.arguments as String;
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context);
    final Cloth cloth =
        clothesProvider.clothes.firstWhere((Cloth cl) => cl.id == clothId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(cloth.imgUrl),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cloth.name.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    'Rp. ${cloth.price.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(cloth.desc),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Size',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: ['S', 'M', 'L', 'XL']
                          .map((size) => Container(
                                color: Theme.of(context).highlightColor,
                                child: Text(
                                  size,
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ),
                                padding: EdgeInsets.all(15),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    Text('Add to Cart'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
