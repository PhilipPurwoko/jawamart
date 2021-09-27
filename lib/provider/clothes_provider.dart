import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cloth with ChangeNotifier {
  Cloth({
    required this.id,
    required this.name,
    required this.desc,
    required this.imgUrl,
    required this.price,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String desc;
  final String imgUrl;
  final double price;
  bool isFavorite;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  static String toJSON(Cloth cloth) {
    return json.encode(<String, dynamic>{
      'name': cloth.name,
      'price': cloth.price,
      'desc': cloth.desc,
      'imgUrl': cloth.imgUrl,
    });
  }
}

class ClothesProvider with ChangeNotifier {
  final List<Cloth> _clothes = <Cloth>[];

  void refresh() {
    notifyListeners();
  }

  Future<void> fetchData() async {
    final Uri url = Uri.parse(
      'https://jawamart-5604a-default-rtdb.asia-southeast1.firebasedatabase.app/clothes.json',
    );
    final http.Response res = await http.get(url);
    final Map<String, dynamic> clothes =
        json.decode(res.body) as Map<String, dynamic>;
    clothes.forEach((String clothId, dynamic clothData) {
      _clothes.add(
        Cloth(
          id: clothId,
          name: clothData['name'].toString(),
          price: double.parse(clothData['price'].toString()),
          desc: clothData['desc'].toString(),
          imgUrl: clothData['imgUrl'].toString(),
        ),
      );
    });
    notifyListeners();
  }

  List<Cloth> get clothes => _clothes;

  List<Cloth> get favClothes =>
      _clothes.where((Cloth c) => c.isFavorite).toList();

  Cloth findById(String id) => _clothes.firstWhere((Cloth c) => c.id == id);

  Future<void> addCloth(Cloth cloth) async {
    try {
      final Uri url = Uri.parse(
        'https://jawamart-5604a-default-rtdb.asia-southeast1.firebasedatabase.app/clothes.json',
      );
      final int existingClothIndex = _clothes.indexWhere(
        (Cloth clh) => clh.id == cloth.id,
      );

      if (existingClothIndex == -1) {
        await http.post(url, body: Cloth.toJSON(cloth));
        _clothes.add(cloth);
      } else {
        _clothes[existingClothIndex] = cloth;
      }

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void deleteCloth(String id) {
    _clothes.removeWhere((Cloth cloth) => cloth.id == id);
    notifyListeners();
  }
}
