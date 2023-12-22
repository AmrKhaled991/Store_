import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';
import 'package:store/feature/Prodacts/data/datasource/LocalProductrepo.dart';
import 'package:store/feature/Prodacts/data/datasource/RemoteProductrepo.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';
import 'package:store/feature/Prodacts/doman/repo/Prodactrepo.dart';

class ImpProdactRepo extends ProdactRepo {
  RemoteProductrepo remoteProductrepo;
  LocalProductrepo localProductrepo;
  ImpProdactRepo(
      {required this.remoteProductrepo, required this.localProductrepo});

  Future<Either<Failure, List<ProductModel>>> prodactlist() async {
    try {
      List<ProductModel> model = await remoteProductrepo.prodactlist();
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServierError.fromDioError(e));
      }
      return left(ServierError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addtocart(Modelcart modelcart) {
    // TODO: implement addtocart
    return localProductrepo.addtocart(modelcart);
  }
}
