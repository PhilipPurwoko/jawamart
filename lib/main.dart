import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import './screen/detail_screen.dart';
import './screen/shop_screen.dart';
import './provider/clothes_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClothesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: myTheme,
        initialRoute: ShopScreen.routeName,
        routes: {
          ShopScreen.routeName: (_) => ShopScreen(),
          DetailScreen.routeName: (_) => DetailScreen(),
        },
      ),
    );
  }
}
