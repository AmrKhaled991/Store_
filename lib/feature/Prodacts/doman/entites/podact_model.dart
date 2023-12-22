class ProductModel {
  String? titel;
  int? sold;
  String? cover;
  int? price;
  String? id;
  double? ratingsAverage;
  String? description;
  List<String>? photos;
  int? quntity;
  ProductModel({
    required this.titel,
    required this.sold,
    required this.cover,
    required this.price,
    required this.id,
    required this.ratingsAverage,
    required this.description,
    required this.photos,
    required this.quntity,
  });
}
