import 'package:flutter/material.dart';
import 'manage_clothes_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListView(
        children: <ListTile>[
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('My Order'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('Manage Clothes'),
            onTap: () {
              Navigator.of(context).pushNamed(ManageClothesScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
