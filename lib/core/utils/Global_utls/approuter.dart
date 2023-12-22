import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/Global_utls/Get_it.dart';
import 'package:store/core/utils/Stripe/Stripecubit/stripe_cubit.dart';
import 'package:store/core/utils/Stripe/repo/Striperepo.dart';
import 'package:store/core/utils/countercubit/cubit/counter_cubit.dart';
import 'package:store/feature/Autauthentication/Presention/login/views/LoginView.dart';
import 'package:store/feature/Autauthentication/Presention/manger/cubit/auth_cubit_cubit.dart';
import 'package:store/feature/Autauthentication/Presention/register/view/RegisterView.dart';
import 'package:store/feature/Autauthentication/doman/usecases/AuthUsecases.dart';
import 'package:store/feature/Cart/doman/repo/CartRepo.dart';
import 'package:store/feature/Cart/presention/manger/cubit/HivecartCubit.dart';
import 'package:store/feature/Cart/presention/view/Cart.dart';
import 'package:store/feature/Home/doman/uscases/CatUsecases.dart';
import 'package:store/feature/Home/presention/manger/cubit/home_cubit.dart';
import 'package:store/feature/Home/presention/view/HomeScreen.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';
import 'package:store/feature/Prodacts/doman/usecse/Porductusecases.dart';
import 'package:store/feature/Prodacts/presetnion/manger/Fetchproductcubit/product_cubit.dart';

import 'package:store/feature/Prodacts/presetnion/view/ProdactdetielsView.dart/Prodactdetiels.dart';
import 'package:store/feature/splashscreen/Splashscreen.dart';

abstract class AppRouter {
  static const kHome = '/homeView';
  static const klogin = '/klogin';
  static const kregister = '/kregister';
  static const kitemdetiels = '/kitemdetiels';
  static const cart = '/cart';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kHome,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) =>
                    HomeCubit(getIt.get<CatUsecases>())..categories()),
            BlocProvider(
                create: (_) => BrandCubit(getIt.get<CatUsecases>())..brands()),
            BlocProvider(
                create: (_) =>
                    ProductCubit(getIt.get<Productusecase>())..getlist()),
            BlocProvider(
                create: (_) =>
                    HivecartCubit(getIt.get<CartRepo>().getcartitems()))
          ],
          child: const Homescreen(),
        ),
      ),
      GoRoute(
        path: cart,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  HivecartCubit(getIt.get<CartRepo>().getcartitems()),
            ),
            BlocProvider(
              create: (context) => StripeCubit(getIt.get<StripeRepo>()),
            ),
          ],
          child: Cart(),
        ),
      ),
      GoRoute(
        path: kitemdetiels,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CounterCubit(),
            ),
            BlocProvider(
                create: (_) =>
                    HivecartCubit(getIt.get<CartRepo>().getcartitems()))
          ],
          child: Prodactdetieles(productModel: state.extra as ProductModel),
        ),
      ),
      GoRoute(
        path: klogin,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubitCubit(getIt.get<AuthUsecases>()),
          child: LoginView(),
        ),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => Splashsceen(),
      ),
      GoRoute(
        path: kregister,
        builder: (context, state) => RegiteView(),
      ),
    ],
  );
}
