import 'dart:ffi';

import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:store/core/API/Apimanger.dart';
import 'package:store/core/utils/Global_utls/Apikeys.dart';
import 'package:store/core/utils/Stripe/responsemodles/customer_response/customer_response.dart';
import 'package:store/core/utils/Stripe/responsemodles/ephormalkey/ephormalkey.dart';
import 'package:store/core/utils/Stripe/responsemodles/stripen_creat_respons/stripen_creat_respons.dart';
import 'package:store/core/utils/Stripe/intintmodles/Creatpaymentmodel.dart';

class StripeServise {
  Apimanger apimanger;
  StripeServise({
    required this.apimanger,
  });

  Future<StripenCreatRespons> getdata(
      Paymentmodel paymentmodel, String customer) async {
    var map = await apimanger.Stripepost(
        token: Api_keys.Stripescretkey,
        json: paymentmodel.tojeson(customer),
        endpoint: 'https://api.stripe.com/v1/payment_intents');
    StripenCreatRespons data = StripenCreatRespons.fromJson(map);
    return data;
  }

  //for testing it should be in register
  Future<String> crantcustmerid() async {
    var map = await apimanger.Stripepost(
        token: Api_keys.Stripescretkey,
        json: {'name': 'amr', 'email': 'amrkhaled033@gmail.com'},
        endpoint: 'https://api.stripe.com/v1/customers');
    CustomerResponse data = CustomerResponse.fromJson(map);
    return data.id!;
  }

  Future<String> ephemeral_keys(String customerkey) async {
    var map = await apimanger.Stripepost(
        token: Api_keys.Stripescretkey,
        json: {
          'customer': customerkey,
        },
        heders: {
          'Authorization': "Bearer ${Api_keys.Stripescretkey}",
          'Stripe-Version': '2023-08-16',
        },
        endpoint: 'https://api.stripe.com/v1/ephemeral_keys');
    var screetkey = Ephormalkey.fromJson(map);

    return screetkey.secret!;
  }

  Future<void> initPaymentSheet(
      {required StripenCreatRespons intintdata,
      required String customerid,
      required String secretid}) async {
    // 1. create payment intent on the server      // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Amr khaled',
      paymentIntentClientSecret: intintdata.clientSecret,
      customerEphemeralKeySecret: secretid,
      customerId: customerid,
    ));
  }

  Future<void> prestnpaymentsheet(
      Paymentmodel paymentmodel, String custemrid) async {
    String secretkey = await ephemeral_keys(custemrid).then((value) {
      print('====> p2');
      return value;
    });
    var data = await getdata(paymentmodel, custemrid).then((value) {
      print('====> p3');
      return value;
    });

    await initPaymentSheet(
            intintdata: data, customerid: custemrid, secretid: secretkey)
        .then((value) {
      print('====> p4');
      return value;
    });
    await Stripe.instance.presentPaymentSheet().then((value) {
      print('====> p5');
    });
  }
}
