import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/widgets/AuthElvatedbutom.dart';
import 'package:store/core/utils/widgets/Emailfieald.dart';
import 'package:store/core/utils/widgets/Passwordfield.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/Global_utls/approuter.dart';
import 'package:store/feature/Autauthentication/Presention/manger/cubit/auth_cubit_cubit.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
    required this.formkey,
    required this.emailcontroler,
    required this.passwordcontroler,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController emailcontroler;
  final TextEditingController passwordcontroler;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formkey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 60.h,
          ),
          Center(child: Image.asset('assets/images/rout5.png')),
          SizedBox(
            height: 60.h,
          ),
          const Text(
            'Welcome Back To Route',
            style: Styles.textsize24,
          ),
          Text(
            'Please sign in with your mail',
            style: Styles.textsize12.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 40.h,
          ),
          Emailfieald(controller: emailcontroler),
          SizedBox(
            height: 16.h,
          ),
          Passwordfield(controller: passwordcontroler),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot password',
              style:
                  Styles.textsizewhite18.copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          AuthElvatedbutom(
              onPressed: () {
                onpressd(context);
              },
              text: 'Login'),
          Center(
            child: TextButton(
                onPressed: () => context.go(AppRouter.kregister),
                child: Text(
                  'Don’t have an account? Create Account',
                  style: Styles.textsizewhite18,
                  textAlign: TextAlign.center,
                )),
          ),
        ]),
      ),
    );
  }

  onpressd(BuildContext context) {
    if (formkey.currentState!.validate()) {
      BlocProvider.of<AuthCubitCubit>(context)
          .login(emailcontroler.text, passwordcontroler.text);
    }
  }
}
