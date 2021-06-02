import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cloth with ChangeNotifier {
  final String id;
  final String name;
  final String desc;
  final String imgUrl;
  final double price;
  bool isFavorite;

  Cloth({
    @required this.id,
    @required this.name,
    @required this.desc,
    @required this.imgUrl,
    @required this.price,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  static String toJSON(Cloth cloth) {
    return json.encode({
      'name': cloth.name,
      'price': cloth.price,
      'desc': cloth.desc,
      'imgUrl': cloth.imgUrl,
    });
  }
}

class ClothesProvider with ChangeNotifier {
  List<Cloth> _clothes = [
    // Cloth(
    //   id: '123',
    //   name: 'Kaos',
    //   imgUrl:
    //       'https://cdn.pixabay.com/photo/2014/08/26/21/48/shirts-428600_960_720.jpg',
    //   desc:
    //       'T-shirt, atau kaos oblong, adalah model kemeja berbahan kain yang dinamai bentuk tubuh dan lengan T. Secara tradisional, ia memiliki lengan pendek dan garis leher bulat, yang dikenal sebagai leher kru, yang tidak memiliki kerah.',
    //   price: 50000,
    // ),
    // Cloth(
    //   id: '456',
    //   name: 'Celana',
    //   imgUrl:
    //       'https://cdn.pixabay.com/photo/2016/01/19/14/45/person-1148941_960_720.jpg',
    //   desc:
    //       'Celana pendek adalah pakaian bawahan bercabang dua yang dikenakan oleh laki-laki dan perempuan di wilayah pinggul mereka, mengitari pinggang, dan menutupi bagian atas kaki, kadang-kadang lebih panjang sampai ke bawah lutut.',
    //   price: 50000,
    // ),
  ];

  void refresh() {
    notifyListeners();
  }

  Future fetchData() async {
    final Uri url = Uri.parse(
        'https://jawamart-5604a-default-rtdb.asia-southeast1.firebasedatabase.app/clothes.json');
    var res = await http.get(url);
    var clothes = json.decode(res.body) as Map<String, dynamic>;
    clothes.forEach((clothId, clothData) {
      _clothes.add(Cloth(
        id: clothId,
        name: clothData['name'],
        price: double.parse(clothData['price'].toString()),
        desc: clothData['desc'],
        imgUrl: clothData['imgUrl'],
      ));
    });
    notifyListeners();
  }

  List<Cloth> get clothes {
    return [..._clothes];
  }

  List<Cloth> get favClothes {
    return _clothes.where((Cloth cloth) => cloth.isFavorite).toList();
  }

  Cloth findById(String id) {
    return _clothes.firstWhere((Cloth cloth) => cloth.id == id);
  }

  Future<void> addCloth(Cloth cloth) async {
    try {
      final Uri url = Uri.parse(
          'https://jawamart-5604a-default-rtdb.asia-southeast1.firebasedatabase.app/clothes.json');
      final existingClothIndex =
          _clothes.indexWhere((Cloth clh) => clh.id == cloth.id);

      if (existingClothIndex == -1) {
        await http.post(url, body: Cloth.toJSON(cloth));
        _clothes.add(cloth);
      } else {
        _clothes[existingClothIndex] = cloth;
      }

      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  void deleteCloth(String id) {
    _clothes.removeWhere((Cloth cloth) => cloth.id == id);
    notifyListeners();
  }
}
