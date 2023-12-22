import 'package:hive/hive.dart';
part 'modelcart.g.dart';

@HiveType(typeId: 1)
class Modelcart {
  @HiveField(0)
  String image;
  @HiveField(1)
  int? quntity;
  @HiveField(2)
  int? price;
  @HiveField(3)
  String? titel;
  Modelcart({
    required this.image,
    this.quntity,
    this.price,
    this.titel,
  });
}
