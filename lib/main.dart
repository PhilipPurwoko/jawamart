import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'theme.dart';

import './screen/nav_screen.dart';
import './screen/detail_screen.dart';
import './screen/shop_screen.dart';

import './provider/cart_provider.dart';
import './provider/clothes_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ClothesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'JawaMart',
        // theme: myTheme,
        initialRoute: NavScreen.routeName,
        routes: {
          NavScreen.routeName: (_) => NavScreen(),
          ShopScreen.routeName: (_) => ShopScreen(),
          DetailScreen.routeName: (_) => DetailScreen(),
        },
      ),
    );
  }
}
