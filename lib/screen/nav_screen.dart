import 'package:flutter/material.dart';
import './cart_screen.dart';
import './shop_screen.dart';
import './favorite_screen.dart';

class NavScreen extends StatefulWidget {
  static String routeName = '/nav';
  
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _navigationIndex = 0;
  final List<Widget> _screens = <Widget>[
    ShopScreen(),
    FavoriteScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('JawaMart'),
        ),
        body: IndexedStack(
          index: _navigationIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navigationIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
          onTap: (int index) {
            setState(() {
              _navigationIndex = index;
            });
          },
        ),
      ),
    );
  }
}
