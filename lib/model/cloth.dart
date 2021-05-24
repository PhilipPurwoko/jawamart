import 'package:flutter/foundation.dart';

enum Size { S, M, L, XL }

class Cloth {
  final String id;
  final String name;
  final String desc;
  final String imgUrl;
  final int price;
  final List<Size> size;

  Cloth({
    @required this.id,
    @required this.name,
    @required this.desc,
    @required this.imgUrl,
    @required this.price,
    @required this.size,
  });

  static final List<Cloth> clothes = [
    Cloth(
      id: '123',
      name: 'Kaos',
      imgUrl:
          'https://cdn.pixabay.com/photo/2014/08/26/21/48/shirts-428600_960_720.jpg',
      desc:
          'T-shirt, atau kaos oblong, adalah model kemeja berbahan kain yang dinamai bentuk tubuh dan lengan T. Secara tradisional, ia memiliki lengan pendek dan garis leher bulat, yang dikenal sebagai leher kru, yang tidak memiliki kerah.',
      price: 50000,
      size: [Size.L, Size.XL],
    ),
    Cloth(
      id: '456',
      name: 'Celana',
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/01/19/14/45/person-1148941_960_720.jpg',
      desc:
          'Celana pendek adalah pakaian bawahan bercabang dua yang dikenakan oleh laki-laki dan perempuan di wilayah pinggul mereka, mengitari pinggang, dan menutupi bagian atas kaki, kadang-kadang lebih panjang sampai ke bawah lutut.',
      price: 50000,
      size: [Size.S, Size.M, Size.L],
    ),
  ];
}
