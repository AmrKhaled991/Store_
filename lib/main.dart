import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store/core/utils/Global_utls/Apikeys.dart';
import 'package:store/core/utils/Global_utls/Get_it.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/utils/Global_utls/approuter.dart';

void main() async {
  Stripe.publishableKey = Api_keys.StripePublishedkey;

  getitmethod();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelcartAdapter());
  await Hive.openBox<Modelcart>('cartitems');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
