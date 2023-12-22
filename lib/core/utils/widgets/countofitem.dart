// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/countercubit/cubit/counter_cubit.dart';

class Countofitem extends StatefulWidget {
  Countofitem({
    Key? key,
  }) : super(key: key);

  @override
  State<Countofitem> createState() => _CountofitemState();
}

class _CountofitemState extends State<Countofitem> {
  @override
  Widget build(BuildContext context) {
    var numb = BlocProvider.of<CounterCubit>(context).counter;
    print(numb);
    return Container(
      height: 37.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: maincolor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                if (numb > 1) {
                  BlocProvider.of<CounterCubit>(context).counter--;
                  BlocProvider.of<CounterCubit>(context).remove();
                }
                ;
                setState(() {});
              },
              icon: Icon(
                Icons.remove_circle_outline_outlined,
                size: 24.r,
                color: Colors.white,
              )),
          Text(
            numb.toString(),
            style: Styles.textsizewhite18,
          ),
          IconButton(
              onPressed: () {
                if (numb < 9) {
                  BlocProvider.of<CounterCubit>(context).counter++;
                  BlocProvider.of<CounterCubit>(context).add();
                  setState(() {});
                }
              },
              icon: Icon(
                Icons.add_circle_outline_rounded,
                size: 24.r,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
