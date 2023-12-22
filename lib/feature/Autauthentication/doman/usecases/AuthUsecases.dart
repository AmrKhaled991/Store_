// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Autauthentication/doman/entits/RegisterRequst.dart';
import 'package:store/feature/Autauthentication/doman/entits/UserModel.dart';
import 'package:store/feature/Autauthentication/doman/repo/AuthRepo.dart';

class AuthUsecases {
  AuthRepo authrepo;
  AuthUsecases({
    required this.authrepo,
  });

  Future<Either<Failure, UserModel>> login(String email, String password) {
    // check permession
    return authrepo.login(email, password);
  }

  Future<Either<Failure, UserModel>> register(RegisterRequst regisetrequst) {
    // check permession

    return authrepo.register(regisetrequst);
  }
}
