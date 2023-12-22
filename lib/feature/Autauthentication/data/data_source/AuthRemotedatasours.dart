// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:store/core/API/Apimanger.dart';
import 'package:store/core/utils/Global_utls/Get_it.dart';
import 'package:store/feature/Autauthentication/doman/entits/RegisterRequst.dart';
import 'package:store/core/utils/Global_utls/flutter_scuredata.dart';
import 'package:store/feature/Autauthentication/data/Models/response_user_data/response_user_data.dart';
import 'package:store/feature/Autauthentication/doman/entits/UserModel.dart';

abstract class AuthRemotedatasours {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(RegisterRequst regisetrequst);
}

class ImpAuthRemotedatasours extends AuthRemotedatasours {
  Apimanger apimanger;
  ImpAuthRemotedatasours({
    required this.apimanger,
  });
  @override
  Future<UserModel> login(String email, String password) async {
    print('auth remote');
    var data = await apimanger.post(
        endPoint: 'auth/signin', data: {"email": email, "password": password});
    UserModel model = ResponseUserData.fromMap(data);
    getIt.get<SecureStorage>().writeSecureData('token', model.token);
    return model;
  }

  @override
  Future<UserModel> register(RegisterRequst regisetrequst) async {
    var data = await apimanger.post(endPoint: 'auth/signup', data: {
      "name": regisetrequst.fullname,
      "email": regisetrequst.email,
      "password": regisetrequst.password,
      "rePassword": regisetrequst.repassword,
      "phone": regisetrequst.number
    });
    UserModel model = ResponseUserData.fromMap(data);
    getIt.get<SecureStorage>().writeSecureData('token', model.token);
    return model;
  }
}
