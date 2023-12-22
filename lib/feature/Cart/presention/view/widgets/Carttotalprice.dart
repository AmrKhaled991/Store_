// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/feature/Cart/presention/manger/cubit/HivecartCubit.dart';

class Carttotalprice extends StatefulWidget {
  Carttotalprice({
    Key? key,
  }) : super(key: key);

  @override
  State<Carttotalprice> createState() => _CarttotalpriceState();
}

class _CarttotalpriceState extends State<Carttotalprice> {
  Widget build(BuildContext context) {
    var price = BlocProvider.of<HivecartCubit>(context).totlacount();

    return Column(
      children: [
        Text(
          'Total price',
          style: Styles.textsizecoler2_18,
        ),
        SizedBox(
          height: 2.h,
        ),
        BlocListener<HivecartCubit, HiveCartState>(
          child: Text(
            '${price} EGP',
            style: Styles.textsize18,
          ),
          listener: (BuildContext context, HiveCartState state) {
            setState(() {
              price = 0;
            });
          },
        )
      ],
    );
  }
}
