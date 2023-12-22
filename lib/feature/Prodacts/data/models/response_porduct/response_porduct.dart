import 'dart:convert';

import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';

import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

class ResponsePorduct extends ProductModel {
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  List<dynamic>? availableColors;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;

  ResponsePorduct({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.availableColors,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  }) : super(
            description: description,
            cover: imageCover,
            id: id,
            photos: images,
            price: price,
            quntity: quantity,
            ratingsAverage: ratingsAverage,
            sold: sold,
            titel: title);

  factory ResponsePorduct.fromMap(Map<String, dynamic> data) {
    return ResponsePorduct(
      sold: data['sold'] as int?,
      images: getimges(data['images']),
      subcategory: (data['subcategory'] as List<dynamic>?)
          ?.map((e) => Subcategory.fromMap(e as Map<String, dynamic>))
          .toList(),
      ratingsQuantity: data['ratingsQuantity'] as num?,
      id: data['_id'] as String?,
      title: data['title'] as String?,
      slug: data['slug'] as String?,
      description: data['description'] as String?,
      quantity: data['quantity'] as int?,
      price: data['price'] as int?,
      availableColors: data['availableColors'] as List<dynamic>?,
      imageCover: data['imageCover'] as String?,
      category: data['category'] == null
          ? null
          : Category.fromMap(data['category'] as Map<String, dynamic>),
      brand: data['brand'] == null
          ? null
          : Brand.fromMap(data['brand'] as Map<String, dynamic>),
      ratingsAverage: (data['ratingsAverage'] as num?)?.toDouble(),
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'sold': sold,
        'images': images,
        'subcategory': subcategory?.map((e) => e.toMap()).toList(),
        'ratingsQuantity': ratingsQuantity,
        '_id': id,
        'title': title,
        'slug': slug,
        'description': description,
        'quantity': quantity,
        'price': price,
        'availableColors': availableColors,
        'imageCover': imageCover,
        'category': category?.toMap(),
        'brand': brand?.toMap(),
        'ratingsAverage': ratingsAverage,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResponsePorduct].
  factory ResponsePorduct.fromJson(String data) {
    return ResponsePorduct.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResponsePorduct] to a JSON string.
  String toJson() => json.encode(toMap());
}

List<String> getimges(List<dynamic> items) {
  List<String> imges = [];
  for (var image in items) {
    imges.add(image);
  }
  return imges;
}
