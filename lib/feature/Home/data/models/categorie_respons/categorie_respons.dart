import 'datum.dart';
import 'metadata.dart';

class CategorieRespons {
  int? results;
  Metadata? metadata;
  List<Datum>? data;

  CategorieRespons({this.results, this.metadata, this.data});

  factory CategorieRespons.fromJson(Map<String, dynamic> json) {
    return CategorieRespons(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results,
        'metadata': metadata?.toJson(),
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
