import 'package:dartz/dartz.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/core/utils/Stripe/intintmodles/Creatpaymentmodel.dart';

abstract class StripeRepo {
  Future<Either<Failure, void>> presntsheet(Paymentmodel paymentmodel);
}
