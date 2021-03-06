import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cart_screen.dart';
import './dashboard_screen.dart';
import './favorite_screen.dart';
import './shop_screen.dart';
import '../provider/clothes_provider.dart';

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
    DashboardScreen(),
  ];

  @override
  void initState() {
    Provider.of<ClothesProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('JawaMart'),
          actions: <IconButton>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: IndexedStack(
          index: _navigationIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navigationIndex,
          unselectedItemColor: Colors.grey,
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
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
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
