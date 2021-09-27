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
            leading: const Icon(Icons.local_shipping),
            title: const Text('My Order'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Manage Clothes'),
            onTap: () {
              Navigator.of(context).pushNamed(ManageClothesScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
