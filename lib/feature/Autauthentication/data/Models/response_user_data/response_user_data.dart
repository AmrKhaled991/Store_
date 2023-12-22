import 'dart:convert';
import 'package:store/feature/Autauthentication/doman/entits/UserModel.dart';
import 'user.dart';

class ResponseUserData extends UserModel {
  String? message;
  User? user;
  String token;

  ResponseUserData({this.message, this.user, required this.token})
      : super(name: user!.name!, email: user.email!, token: token);

  factory ResponseUserData.fromMap(Map<String, dynamic> data) {
    return ResponseUserData(
      message: data['message'] as String?,
      user: data['user'] == null
          ? null
          : User.fromMap(data['user'] as Map<String, dynamic>),
      token: data['token'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'user': user?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResponseUserData].
  factory ResponseUserData.fromJson(String data) {
    return ResponseUserData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResponseUserData] to a JSON string.
  String toJson() => json.encode(toMap());
}
