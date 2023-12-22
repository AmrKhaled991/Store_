import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/widgets/AuthElvatedbutom.dart';
import 'package:store/core/utils/widgets/Emailfieald.dart';
import 'package:store/core/utils/widgets/Passwordfield.dart';
import 'package:store/core/utils/widgets/Phone&Userfield.dart';
import 'package:store/feature/Autauthentication/doman/entits/RegisterRequst.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/Global_utls/approuter.dart';
import 'package:store/feature/Autauthentication/Presention/manger/cubit/auth_cubit_cubit.dart';

class RegsiterBody extends StatelessWidget {
  const RegsiterBody({
    super.key,
    required this.formkey,
    required this.namecotrler,
    required this.phonecontroler,
    required this.emailcontroler,
    required this.passwordcontroler,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController namecotrler;
  final TextEditingController phonecontroler;
  final TextEditingController emailcontroler;
  final TextEditingController passwordcontroler;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Center(child: Image.asset('assets/images/rout5.png')),
            SizedBox(
              height: 46.h,
            ),
            Phone_userfiekd(
                controller: namecotrler,
                name: 'Fullname',
                hinttext: 'pleaser enter your full name',
                textInputType: TextInputType.name),
            SizedBox(
              height: 16.h,
            ),
            Phone_userfiekd(
                controller: phonecontroler,
                name: 'Phone Number',
                hinttext: 'pleaser enter your Phone Number',
                textInputType: TextInputType.phone),
            SizedBox(
              height: 16.h,
            ),
            Emailfieald(controller: emailcontroler),
            SizedBox(
              height: 16.h,
            ),
            Passwordfield(controller: passwordcontroler),
            SizedBox(
              height: 40.h,
            ),
            AuthElvatedbutom(
                onPressed: () {
                  onpressd(context);
                },
                text: 'Sign up'),
            Center(
              child: TextButton(
                  onPressed: () => context.go(AppRouter.klogin),
                  child: Text(
                    'already have acount',
                    style: Styles.textsizewhite18,
                  )),
            )
          ],
        ),
      )),
    );
  }

  onpressd(BuildContext context) {
    if (formkey.currentState!.validate()) {
      BlocProvider.of<AuthCubitCubit>(context).register(RegisterRequst(
          email: emailcontroler.text,
          password: passwordcontroler.text,
          repassword: passwordcontroler.text,
          fullname: namecotrler.text,
          number: phonecontroler.text));
    }
  }
}
