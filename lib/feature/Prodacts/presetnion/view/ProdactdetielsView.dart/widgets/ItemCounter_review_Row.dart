// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

import '../../../../../../core/utils/widgets/countofitem.dart';

class ItemCounter_review_Row extends StatelessWidget {
  int sold;
  double rating;
  ItemCounter_review_Row({
    Key? key,
    required this.sold,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: Text(
              '$sold Sold',
              style: Styles.textsize14,
            ),
          ),
          height: 34.h,
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            border: Border.all(
              color: maincolor,
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Row(
          children: [
            Icon(
              Icons.star_outlined,
              size: 15,
              color: Colors.yellow.shade600,
            ),
            Text(
              '$rating (7,500)',
              style: Styles.textsize12,
            ),
          ],
        ),
        Spacer(),
        Countofitem(),
      ],
    );
  }
}
