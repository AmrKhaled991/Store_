import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store/core/API/Apimanger.dart';
import 'package:store/core/utils/Stripe/StripeServise.dart';
import 'package:store/core/utils/Stripe/repo/StripeRepoImp.dart';
import 'package:store/core/utils/Stripe/repo/Striperepo.dart';
import 'package:store/core/utils/Global_utls/flutter_scuredata.dart';
import 'package:store/feature/Autauthentication/data/data_source/AuthRemotedatasours.dart';
import 'package:store/feature/Autauthentication/data/impreops/AuthRepo.dart';
import 'package:store/feature/Autauthentication/doman/usecases/AuthUsecases.dart';
import 'package:store/feature/Cart/data/repoimp/CartRepoimp.dart';
import 'package:store/feature/Cart/doman/repo/CartRepo.dart';
import 'package:store/feature/Home/data/datasource/HomeRemotedatasours.dart';
import 'package:store/feature/Home/data/imprepos/ImpHomeRepo.dart';
import 'package:store/feature/Home/doman/uscases/CatUsecases.dart';
import 'package:store/feature/Prodacts/data/datasource/LocalProductrepo.dart';
import 'package:store/feature/Prodacts/data/datasource/RemoteProductrepo.dart';
import 'package:store/feature/Prodacts/data/imprepo/ImpProductrepo.dart';
import 'package:store/feature/Prodacts/doman/usecse/Porductusecases.dart';

GetIt getIt = GetIt.instance;
getitmethod() {
  getIt.registerLazySingleton<Apimanger>(() => Apimanger(dio: Dio()));
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
  getIt.registerLazySingleton<StripeRepo>(() => StripeRepoimpl(
      servise: StripeServise(apimanger: getIt.get<Apimanger>())));
  getIt.registerLazySingleton<AuthUsecases>(() => AuthUsecases(
      authrepo: ImpAuthRepo(
          authRemotedatasours:
              ImpAuthRemotedatasours(apimanger: getIt.get<Apimanger>()))));
  getIt.registerLazySingleton<CatUsecases>(() => CatUsecases(
      categoriesRepo: ImpHomeRepo(
          homeRemotedatasours:
              ImpHomeRemotedatasours(apimanger: getIt.get<Apimanger>()))));
  getIt.registerLazySingleton<Productusecase>(() => Productusecase(
      prodactRepo: ImpProdactRepo(
          localProductrepo: LocalProductrepoimp(),
          remoteProductrepo:
              ImpRemoteProductrepo(apimanger: getIt.get<Apimanger>()))));
  getIt.registerLazySingleton<CartRepo>(() => LocalCartRepoimp());
}
