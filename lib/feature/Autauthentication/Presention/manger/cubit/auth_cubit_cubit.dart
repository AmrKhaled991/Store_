import 'package:bloc/bloc.dart';

import 'package:store/feature/Autauthentication/doman/entits/RegisterRequst.dart';

import 'package:store/feature/Autauthentication/doman/entits/UserModel.dart';

import 'package:store/feature/Autauthentication/doman/usecases/AuthUsecases.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit(this.authUsecases) : super(AuthCubitInitial());

  AuthUsecases authUsecases;

  void login(String email, String password) async {
    emit(AuthCubitLoading());

    var res = await authUsecases.login(email, password);

    res.fold((l) => emit(AuthCubitError(l.messege)),
        (r) => emit(AuthCubitSucsses(r)));
  }

  void register(RegisterRequst registerRequst) async {
    emit(AuthCubitLoading());

    var res = await authUsecases.register(registerRequst);

    res.fold((l) => emit(AuthCubitError(l.messege)),
        (r) => emit(AuthCubitSucsses(r)));
  }

  @override
  void onChange(Change<AuthCubitState> change) {
    // TODO: implement onChange

    super.onChange(change);

    print(change);
  }
}
