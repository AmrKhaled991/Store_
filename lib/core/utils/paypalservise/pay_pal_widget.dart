// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
// import 'package:store/core/utils/Global_utls/Apikeys.dart';
// import 'package:store/core/utils/paypalservise/paypalmodels/pay_pal_itemlistmodale/item.dart';
// import 'package:store/core/utils/paypalservise/paypalmodels/pay_pal_itemlistmodale/pay_pal_itemlistmodale.dart';
// import 'package:store/core/utils/paypalservise/paypalmodels/pay_pal_itemlistmodale/shipping_address.dart';
// import 'package:store/core/utils/paypalservise/paypalmodels/paypal_amount_modale/details.dart';
// import 'package:store/core/utils/paypalservise/paypalmodels/paypal_amount_modale/paypal_amount_modale.dart';

// class PayPalWidget extends StatelessWidget {
//   Map amountjeson;
//   Map itemlist;
//   PayPalWidget({
//     Key? key,
//     required this.amountjeson,
//     required this.itemlist,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PaypalCheckoutView(
//       sandboxMode: true,
//       clientId: Api_keys.Paypalpuplishkey,
//       secretKey: Api_keys.PayPalSecretkey,
//       transactions: [
//         {
//           "amount": amountjeson,
//           "description": "The payment transaction description.",
//           // "payment_options": {
//           //   "allowed_payment_method":
//           //       "INSTANT_FUNDING_SOURCE"
//           // },
//           "item_list": itemlist
//         }
//       ],
//       note: "Contact us for any questions on your order.",
//       onSuccess: (Map params) async {
//         log("onSuccess: $params");
//         Navigator.pop(context);
//       },
//       onError: (error) {
//         log("onError: $error");
//         Navigator.pop(context);
//       },
//       onCancel: () {
//         print('cancelled:');
//         Navigator.pop(context);
//       },
//     );
//   }
// }

// ({PaypalAmountModale amount, PayPalItemlistmodale itemlist})
//     getPayPalTransaction() {
//   PaypalAmountModale paypalAmountModale = PaypalAmountModale(
//     currency: 'USD',
//     total: "100",
//     details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'),
//   );
//   PayPalItemlistmodale palItemlistmodale = PayPalItemlistmodale(
//     items: [
//       Item(
//         currency: 'USD',
//         name: 'Apple',
//         price: "4",
//         quantity: 10,
//       ),
//       Item(
//         currency: 'USD',
//         name: 'amoor',
//         price: "4",
//         quantity: 10,
//       )
//     ],
//     shippingAddress: ShippingAddress(
//         city: "alexandria",
//         phone: "01557043883",
//         line1: "sidi kamal mandura bahare"),
//   );
//   return (itemlist: palItemlistmodale, amount: paypalAmountModale);
// }
