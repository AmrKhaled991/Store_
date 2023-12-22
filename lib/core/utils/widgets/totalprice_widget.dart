// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/countercubit/cubit/counter_cubit.dart';

class Totalprice_widget extends StatefulWidget {
  int price;
  Totalprice_widget({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  State<Totalprice_widget> createState() => _Totalprice_widgetState();
}

class _Totalprice_widgetState extends State<Totalprice_widget> {
  @override
  Widget build(BuildContext context) {
    var numb = BlocProvider.of<CounterCubit>(context).counter;
    print(numb);
    return Column(
      children: [
        Text(
          'Total price',
          style: Styles.textsizecoler2_18,
        ),
        SizedBox(
          height: 2.h,
        ),
        BlocListener<CounterCubit, CounterState>(
          child: Text(
            'EGP ${numb * widget.price}',
            style: Styles.textsize18,
          ),
          listener: (BuildContext context, CounterState state) {
            if (state is CounteRemove) setState(() {});
            ;
            if (state is Counteradd) setState(() {});
            ;
          },
        )
      ],
    );
  }
}
