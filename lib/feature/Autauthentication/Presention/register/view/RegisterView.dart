import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Get_it.dart';
import 'package:store/core/utils/Global_utls/approuter.dart';
import 'package:store/core/utils/methods/customsnackbar.dart';
import 'package:store/feature/Autauthentication/Presention/manger/cubit/auth_cubit_cubit.dart';
import 'package:store/feature/Autauthentication/doman/usecases/AuthUsecases.dart';
import 'widgets/regsiter_body.dart';

class RegiteView extends StatelessWidget {
  TextEditingController namecotrler = TextEditingController();
  TextEditingController phonecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubitCubit(getIt.get<AuthUsecases>()),
      child: Scaffold(
        backgroundColor: maincolor,
        body: Stack(
          children: [
            RegsiterBody(
                formkey: formkey,
                namecotrler: namecotrler,
                phonecontroler: phonecontroler,
                emailcontroler: emailcontroler,
                passwordcontroler: passwordcontroler),
            BlocConsumer<AuthCubitCubit, AuthCubitState>(
                listener: (context, state) {
              if (state is AuthCubitSucsses) {
                context.go(AppRouter.kHome);
              }
              if (state is AuthCubitError) {
                print(state.message);
                showSnackBar(context, state.message, Colors.red);
              }
            }, builder: (context, state) {
              if (state is AuthCubitLoading) {
                return Stack(
                  children: [
                    ModalBarrier(
                      color: Colors.black.withOpacity(0.3),
                      dismissible: false,
                    ),
                    Center(
                      child: SpinKitPouringHourGlass(
                        color: Colors.white,
                        size: 40.r,
                      ),
                    ),
                  ],
                );
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
