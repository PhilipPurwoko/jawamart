import 'package:flutter/foundation.dart';

class Cloth {
  final String id;
  final String name;
  final String desc;
  final String imgUrl;
  final int price;

  Cloth({
    @required this.id,
    @required this.name,
    @required this.desc,
    @required this.imgUrl,
    @required this.price,
  });
}
