import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/cloth.dart';
import '../widget/cloth_card.dart';

class ShopScreen extends StatelessWidget {
  static final String routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text('Jawa Mart'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('clothes').get(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator()),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (_, index) {
                      var cloth = snapshot.data.docs[index];
                      // return Text(cloth['name']);
                      return ClothCard(
                        Cloth(
                          id: cloth.data()['id'],
                          name: cloth.data()['name'],
                          price: cloth.data()['price'],
                          imgUrl: cloth.data()['imgUrl'],
                          desc: cloth.data()['desc'],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
