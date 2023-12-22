import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Autauthentication/doman/entits/RegisterRequst.dart';
import 'package:store/feature/Autauthentication/data/data_source/AuthRemotedatasours.dart';
import 'package:store/feature/Autauthentication/doman/entits/UserModel.dart';
import 'package:store/feature/Autauthentication/doman/repo/AuthRepo.dart';

class ImpAuthRepo extends AuthRepo {
  AuthRemotedatasours authRemotedatasours;
  ImpAuthRepo({required this.authRemotedatasours});

  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      UserModel model = await authRemotedatasours.login(email, password);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServierError.fromDioError(e));
      }
      return left(ServierError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      RegisterRequst regisetrequst) async {
    try {
      UserModel model = await authRemotedatasours.register(regisetrequst);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServierError.fromDioError(e));
      }
      return left(ServierError(e.toString()));
    }
  }
}
