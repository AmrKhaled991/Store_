part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeCatLoading extends HomeState {}

final class HomeBrandLoading extends HomeState {}

final class HomeCategoriesSucsses extends HomeState {
  List<Categorymodel> listcat;
  HomeCategoriesSucsses(this.listcat);
}

final class HomeBrandsSucsses extends HomeState {
  List<Brandmodel> listbrands;
  HomeBrandsSucsses(this.listbrands);
}

final class HomeCatError extends HomeState {
  String message;
  HomeCatError(this.message);
}

final class HomeBrandError extends HomeState {
  String message;
  HomeBrandError(this.message);
}
