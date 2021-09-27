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
  List<Cloth> _clothes = [];

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
