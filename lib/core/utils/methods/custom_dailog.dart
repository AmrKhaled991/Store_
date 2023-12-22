import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:go_router/go_router.dart';

import 'package:store/constant.dart';


import 'package:store/core/utils/Global_utls/Appassets.dart';


import 'package:store/core/utils/Global_utls/Styles.dart';


import 'package:store/core/utils/Global_utls/approuter.dart';


void custom_showdialog(BuildContext t, String token) {

  showDialog(

      context: t,

      builder: (context) {

        Future.delayed(Duration(seconds: 5), () {

          context.pop();

        });


        return AlertDialog(

          backgroundColor: maincolor,

          shape: UnderlineInputBorder(borderRadius: BorderRadius.circular(10)),

          content: Container(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,

              mainAxisSize: MainAxisSize.min,

              children: [

                Image.asset(Appassets.Paymentsucsses),

                Text('Payment completed', style: Styles.textsize24),

                Text(

                  " Qrcode \n $token",

                  textAlign: TextAlign.center,

                  style: Styles.textsize18,

                )

              ],

            ),

          ),

        );

      });

}

