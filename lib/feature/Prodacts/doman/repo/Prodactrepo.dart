import 'package:dartz/dartz.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';

abstract class ProdactRepo {
  Future<Either<Failure, List<ProductModel>>> prodactlist();
  Future<Either<Failure, void>> addtocart(Modelcart modelcart);
}
