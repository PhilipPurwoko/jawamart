import 'package:flutter/material.dart';
import 'theme.dart';
import './screen/shop_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      initialRoute: ShopScreen.routeName,
      routes: {
        ShopScreen.routeName: (_) => ShopScreen(),
      },
    );
  }
}
