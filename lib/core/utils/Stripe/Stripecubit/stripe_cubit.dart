// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:store/core/utils/Stripe/repo/Striperepo.dart';

import 'package:store/core/utils/Stripe/intintmodles/Creatpaymentmodel.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  StripeRepo stripeRepo;

  StripeCubit(
    this.stripeRepo,
  ) : super(StripeInitial());

  presentsheet(Paymentmodel paymentmodel) async {
    emit(Stripeloading());

    var res = await stripeRepo.presntsheet(paymentmodel);

    res.fold((l) => emit(StripeError(message: l.messege)),
        (r) => emit(StripeSucsses()));
  }

  @override
  void onChange(Change<StripeState> change) {
    // TODO: implement onChange

    super.onChange(change);

    print(change);
  }
}
