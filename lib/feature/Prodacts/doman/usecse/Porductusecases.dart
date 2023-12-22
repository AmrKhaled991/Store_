// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';
import 'package:store/feature/Prodacts/doman/repo/Prodactrepo.dart';

class Productusecase {
  ProdactRepo prodactRepo;
  Productusecase({
    required this.prodactRepo,
  });
  Future<Either<Failure, List<ProductModel>>> prodactlist() {
    return prodactRepo.prodactlist();
  }
}
