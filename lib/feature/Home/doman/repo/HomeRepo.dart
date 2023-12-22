import 'package:dartz/dartz.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Home/doman/entites/Categoremodel.dart';
import 'package:store/feature/Home/doman/entites/brandmodel.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Categorymodel>>> Categories();
  Future<Either<Failure, List<Brandmodel>>> brands();
}
