part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class Productlodaing extends ProductState {}

final class Productlistviewlodaing extends ProductState {}

final class ProductSucsses extends ProductState {
  List<ProductModel> productlist;
  ProductSucsses(this.productlist);
}

final class ProductError extends ProductState {
  String error;
  ProductError(this.error);
}
