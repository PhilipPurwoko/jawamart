import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/cart_provider.dart';
import './provider/clothes_provider.dart';

import './screen/add_cloth_screen.dart';
import './screen/detail_screen.dart';
import './screen/manage_clothes_screen.dart';
import './screen/nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider<ChangeNotifier>>[
        ChangeNotifierProvider<ClothesProvider>(
          create: (_) => ClothesProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'JawaMart',
        initialRoute: NavScreen.routeName,
        routes: <String, Widget Function(BuildContext)>{
          NavScreen.routeName: (_) => NavScreen(),
          DetailScreen.routeName: (_) => DetailScreen(),
          ManageClothesScreen.routeName: (_) => ManageClothesScreen(),
          AddClothScreen.routeName: (_) => AddClothScreen(),
        },
      ),
    );
  }
}
