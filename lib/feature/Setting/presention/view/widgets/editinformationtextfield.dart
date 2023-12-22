// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

class Editinformationtextfield extends StatelessWidget {
  String title;
  String informaion;
  Editinformationtextfield({
    Key? key,
    required this.title,
    required this.informaion,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textsize18,
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: maincolor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                informaion,
                style: Styles.textsize14,
              ),
              InkWell(
                  onTap: () {},
                  child: Image.asset(
                    Appassets.edit,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
