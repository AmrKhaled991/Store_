part of 'stripe_cubit.dart';

@immutable
sealed class StripeState {}

final class StripeInitial extends StripeState {}

final class Stripeloading extends StripeState {}

final class StripeError extends StripeState {
  String message;

  StripeError({required this.message});
}

final class StripeSucsses extends StripeState {}
