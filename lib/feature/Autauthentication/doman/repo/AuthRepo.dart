import 'package:dartz/dartz.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Autauthentication/doman/entits/RegisterRequst.dart';
import 'package:store/feature/Autauthentication/doman/entits/UserModel.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, UserModel>> register(RegisterRequst regisetrequst);
}
