import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/Global_utls/Get_it.dart';
import 'package:store/core/utils/Global_utls/approuter.dart';
import 'package:store/core/utils/Global_utls/flutter_scuredata.dart';

class Splashsceen extends StatefulWidget {
  static String RoutName = 'splash';

  @override
  State<Splashsceen> createState() => _SplashsceenState();
}

class _SplashsceenState extends State<Splashsceen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () async {
        await getIt.get<SecureStorage>().readSecureData('token') == null
            ? context.go(AppRouter.klogin)
            : context.go(AppRouter.kHome);
      },
    );
    return Scaffold(
      body: Image.asset(
        'assets/images/SplashScreen.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
