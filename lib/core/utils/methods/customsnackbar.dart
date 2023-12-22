import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(BuildContext context, String text, Color color) {
  final snackBar = SnackBar(
    content: Center(child: Text(text)),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    width: 300.w,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
