// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Home/doman/entites/Categoremodel.dart';
import 'package:store/feature/Home/doman/entites/brandmodel.dart';
import 'package:store/feature/Home/doman/repo/HomeRepo.dart';

class CatUsecases {
  HomeRepo categoriesRepo;
  CatUsecases({
    required this.categoriesRepo,
  });
  Future<Either<Failure, List<Categorymodel>>> Categories() {
    return categoriesRepo.Categories();
  }

  Future<Either<Failure, List<Brandmodel>>> brands() {
    return categoriesRepo.brands();
  }
}
