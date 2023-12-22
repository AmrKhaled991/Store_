import 'package:store/core/API/Apimanger.dart';
import 'package:store/feature/Prodacts/data/models/response_porduct/response_porduct.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';

abstract class RemoteProductrepo {
  Future<List<ProductModel>> prodactlist();
}

class ImpRemoteProductrepo extends RemoteProductrepo {
  Apimanger apimanger;
  ImpRemoteProductrepo({
    required this.apimanger,
  });

  @override
  Future<List<ProductModel>> prodactlist() async {
    var data = await apimanger.get(endPoint: 'products');
    return getlist(data);
  }
}

List<ProductModel> getlist(Map<String, dynamic> map) {
  List<ProductModel> models = [];
  for (var product in map['data']) {
    models.add(ResponsePorduct.fromMap(product));
  }
  return models;
}
