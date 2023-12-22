part of 'HivecartCubit.dart';


@immutable

sealed class HiveCartState {}


final class HiveCartInitial extends HiveCartState {}


final class HiveCartloading extends HiveCartState {}


final class HiveCartError extends HiveCartState {

  String error;


  HiveCartError(this.error);

}


final class HiveCartADD extends HiveCartState {}


final class HiveAddporductlist extends HiveCartState {
  int? index;

  HiveAddporductlist({this.index});

}


final class HiveCartRemove extends HiveCartState {}


final class HiveCartDeletitem extends HiveCartState {}


final class HiveCartDeletall extends HiveCartState {}

