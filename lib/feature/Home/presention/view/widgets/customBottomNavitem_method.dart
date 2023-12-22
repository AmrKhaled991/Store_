import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BottomNavigationBarItem customBottomNavitem(
    {required int numberwid,
    required String imgage,
    required String unselctedimgage,
    required int index}) {
  return BottomNavigationBarItem(
      label: '_',
      icon: Container(
        child: Image.asset(
          (numberwid != index) ? imgage : unselctedimgage,
          height: 30.h,
          width: 30.w,
          fit: BoxFit.scaleDown,
        ),
      ));
}
