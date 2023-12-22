import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/approuter.dart';
import 'package:store/core/utils/methods/customsnackbar.dart';
import 'package:store/feature/Autauthentication/Presention/manger/cubit/auth_cubit_cubit.dart';

import 'widgets/login_screen_body.dart';

class LoginView extends StatelessWidget {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: maincolor,
        body: BlocConsumer<AuthCubitCubit, AuthCubitState>(
            listener: (context, state) {
          if (state is AuthCubitSucsses) {
            context.go(AppRouter.kHome);
          }
          if (state is AuthCubitError) {
            print(state.message);
            showSnackBar(context, state.message, Colors.red);
          }
        }, builder: (context, state) {
          return Stack(children: [
            LoginScreenBody(
                formkey: formkey,
                emailcontroler: emailcontroler,
                passwordcontroler: passwordcontroler),
            if (state is AuthCubitLoading)
              ModalBarrier(
                color: Colors.black.withOpacity(0.3),
                dismissible: false,
              ),
            if (state is AuthCubitLoading)
              Center(
                child: SpinKitPouringHourGlass(
                  color: Colors.white,
                  size: 40.r,
                ),
              ),
          ]);
        }));
  }
}
