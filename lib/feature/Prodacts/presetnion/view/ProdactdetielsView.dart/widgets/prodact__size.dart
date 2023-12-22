// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

class Prodact_Size extends StatefulWidget {
  const Prodact_Size({super.key});

  @override
  State<Prodact_Size> createState() => _Prodact_SizeState();
}

class _Prodact_SizeState extends State<Prodact_Size> {
  int piceditem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Styles.textsize18,
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 35.h,
          child: ListView.builder(
              itemCount: listSize.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      setState(() {
                        piceditem = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor:
                          piceditem == index ? maincolor : Colors.white,
                      radius: 22.r,
                      child: Text(
                        '${listSize[index]}',
                        style: piceditem == index
                            ? Styles.textwhitesize14
                            : Styles.textsize14,
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}

List<int> listSize = [38, 39, 40, 41, 42];
