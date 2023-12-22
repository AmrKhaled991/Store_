import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Home/doman/entites/Categoremodel.dart';
import 'package:store/feature/Home/doman/entites/brandmodel.dart';
import 'package:store/feature/Home/doman/repo/HomeRepo.dart';
import 'package:store/feature/Home/data/datasource/HomeRemotedatasours.dart';

class ImpHomeRepo extends HomeRepo {
  HomeRemotedatasours homeRemotedatasours;
  ImpHomeRepo({required this.homeRemotedatasours});

  Future<Either<Failure, List<Categorymodel>>> Categories() async {
    try {
      List<Categorymodel> model = await homeRemotedatasours.Categories();
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServierError.fromDioError(e));
      }
      return left(ServierError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Brandmodel>>> brands() async {
    try {
      List<Brandmodel> model = await homeRemotedatasours.brands();
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServierError.fromDioError(e));
      }
      return left(ServierError(e.toString()));
    }
  }
}
