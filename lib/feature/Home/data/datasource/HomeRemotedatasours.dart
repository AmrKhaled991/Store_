import 'package:store/core/API/Apimanger.dart';
import 'package:store/feature/Home/data/models/Brandresponse/brand_response.dart';
import 'package:store/feature/Home/data/models/categorie_respons/categorie_respons.dart';
import 'package:store/feature/Home/doman/entites/Categoremodel.dart';
import 'package:store/feature/Home/doman/entites/brandmodel.dart';

abstract class HomeRemotedatasours {
  Future<List<Categorymodel>> Categories();
  Future<List<Brandmodel>> brands();
}

class ImpHomeRemotedatasours extends HomeRemotedatasours {
  Apimanger apimanger;
  ImpHomeRemotedatasours({
    required this.apimanger,
  });

  Future<List<Categorymodel>> Categories() async {
    var data = await apimanger.get(endPoint: 'categories');
    List<Categorymodel> category = CategorieRespons.fromJson(data).data!;
    return category;
  }

//
  @override
  Future<List<Brandmodel>> brands() async {
    var data = await apimanger.get(endPoint: 'brands?limit=10');
    print(data.length);
    print('[[[[[[data.length]]]]]]');
    return getlist(data);
  }
}

List<Brandmodel> getlist(Map<String, dynamic> map) {
  List<Brandmodel> models = [];
  for (var brand in map['data']) {
    models.add(BrandResponse.fromMap(brand));
  }

  return models;
}
