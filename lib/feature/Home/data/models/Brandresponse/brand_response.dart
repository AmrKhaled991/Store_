// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../doman/entites/brandmodel.dart';

class BrandResponse extends Brandmodel {
  String? id;
  String? name;
  String? image;

  BrandResponse({
    this.id,
    this.name,
    this.image,
  }) : super(image: image);

  factory BrandResponse.fromMap(Map<String, dynamic> data) => BrandResponse(
        id: data['_id'] as String?,
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'name': name,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BrandResponse].
  factory BrandResponse.fromJson(String data) {
    return BrandResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BrandResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
