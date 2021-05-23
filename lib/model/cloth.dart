import 'package:flutter/foundation.dart';

enum Size { S, M, L, XL }

class Cloth {
  final String name;
  final String imgUrl;
  final int price;
  final List<Size> size;

  Cloth({
    @required this.name,
    @required this.imgUrl,
    @required this.price,
    @required this.size,
  });
}