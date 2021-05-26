import 'package:flutter/foundation.dart';

class Cloth with ChangeNotifier {
  final String id;
  final String name;
  final String desc;
  final String imgUrl;
  final int price;
  bool isFavorite;
  bool inCart;

  Cloth({
    @required this.id,
    @required this.name,
    @required this.desc,
    @required this.imgUrl,
    @required this.price,
    this.isFavorite = false,
    this.inCart = false,
  });

  static List<Cloth> fetchData() {
    return [
      Cloth(
        id: '123',
        name: 'Kaos',
        imgUrl:
            'https://cdn.pixabay.com/photo/2014/08/26/21/48/shirts-428600_960_720.jpg',
        desc:
            'T-shirt, atau kaos oblong, adalah model kemeja berbahan kain yang dinamai bentuk tubuh dan lengan T. Secara tradisional, ia memiliki lengan pendek dan garis leher bulat, yang dikenal sebagai leher kru, yang tidak memiliki kerah.',
        price: 50000,
      ),
      Cloth(
        id: '456',
        name: 'Celana',
        imgUrl:
            'https://cdn.pixabay.com/photo/2016/01/19/14/45/person-1148941_960_720.jpg',
        desc:
            'Celana pendek adalah pakaian bawahan bercabang dua yang dikenakan oleh laki-laki dan perempuan di wilayah pinggul mereka, mengitari pinggang, dan menutupi bagian atas kaki, kadang-kadang lebih panjang sampai ke bawah lutut.',
        price: 50000,
      ),
    ];
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toogleCart(){
    inCart = !inCart;
    notifyListeners();
  }
}
