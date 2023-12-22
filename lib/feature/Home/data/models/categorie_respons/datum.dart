import 'package:store/feature/Home/doman/entites/Categoremodel.dart';

class Datum extends Categorymodel {
  String? id;
  String? name;
  String? slug;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  }) : super(idd: id!, photo: image!, title: name!);

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
