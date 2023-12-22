import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/core/utils/Global_utls/Apikeys.dart';
import 'package:store/core/utils/Stripe/StripeServise.dart';
import 'package:store/core/utils/Stripe/repo/Striperepo.dart';
import 'package:store/core/utils/Stripe/intintmodles/Creatpaymentmodel.dart';

class StripeRepoimpl extends StripeRepo {
  StripeServise servise;

  StripeRepoimpl({
    required this.servise,
  });

  @override
  Future<Either<Failure, void>> presntsheet(Paymentmodel paymentmodel) async {
    // TODO: implement presntsheet
    try {
      await servise.prestnpaymentsheet(paymentmodel, Api_keys.customerId);
      return right(null);
    } on Exception catch (e) {
      if (e is StripeException) {
        if (e.error.code == FailureCode.Canceled)
          return left(ServierError('Payment was canceld'));
      }

      return left(ServierError(e.toString()));
    }
  }
}
