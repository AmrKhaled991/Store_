import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';

abstract class Styles {
  static final TextStyle textsizewhite18 = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle textsize18 = TextStyle(
    fontSize: 18.sp,
    color: textcolor,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle textsizecoler2_18 = TextStyle(
    fontSize: 18,
    color: textcolor2,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textsize16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static final TextStyle textsize20 = TextStyle(
    fontSize: 20,
    color: textcolor,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textsizewhite20 = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle textsize14 = TextStyle(
    color: textcolor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textwhitesize14 = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final textsize12 = TextStyle(
    fontSize: 12,
    color: textcolor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textsize24 = TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}
