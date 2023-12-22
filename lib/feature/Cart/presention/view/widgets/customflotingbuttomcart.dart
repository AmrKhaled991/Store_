import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/core/utils/Stripe/Stripecubit/stripe_cubit.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/Stripe/intintmodles/Creatpaymentmodel.dart';
import 'package:store/core/utils/methods/custom_dailog.dart';
import 'package:store/core/utils/methods/customsnackbar.dart';
import 'package:store/core/utils/paypalservise/pay_pal_widget.dart';
import 'package:store/feature/Cart/presention/manger/cubit/HivecartCubit.dart';
import 'package:store/feature/Cart/presention/view/widgets/Carttotalprice.dart';

class Customflotingbuttomcart extends StatelessWidget {
  const Customflotingbuttomcart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var price = BlocProvider.of<HivecartCubit>(context).totlacount();

    return BlocConsumer<StripeCubit, StripeState>(listener: (context, state) {
      if (state is StripeError)
        showSnackBar(context, state.message, Colors.black54);
      if (state is StripeSucsses) {
        BlocProvider.of<HivecartCubit>(context).deleteall();
        custom_showdialog(context, 'thank YOU ,Payment Succesfuly');
      }
    }, builder: (context, state) {
      return Opacity(
        opacity: state is Stripeloading ? .75 : 1,
        child: AbsorbPointer(
          absorbing: state is Stripeloading,
          child: Container(
            height: 75.w,
            width: 335.w,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: maincolor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Carttotalprice(),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<StripeCubit>(context).presentsheet(
                          Paymentmodel(currency: 'usd', amount: price * 100));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (BuildContext context) => PayPalWidget(
                      //       amountjeson: getPayPalTransaction().amount.toJson(),
                      //       itemlist: getPayPalTransaction().itemlist.toJson()),
                      // ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: maincolor,
                        fixedSize: Size(180.w, 47.h)),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 7.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Check Out',
                            style: Styles.textsizewhite20,
                          ),
                          Image.asset(Appassets.check_out),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
