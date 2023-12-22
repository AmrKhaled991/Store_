part of 'auth_cubit_cubit.dart';

sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthCubitSucsses extends AuthCubitState {
  UserModel userModel;
  AuthCubitSucsses(this.userModel);
}

final class AuthCubitError extends AuthCubitState {
  String message;
  AuthCubitError(this.message);
}

final class AuthCubitLoading extends AuthCubitState {}
