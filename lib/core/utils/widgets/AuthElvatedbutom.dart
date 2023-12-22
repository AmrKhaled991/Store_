// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store/core/utils/Global_utls/Styles.dart';

// ignore: must_be_immutable
class AuthElvatedbutom extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  AuthElvatedbutom({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(50.h),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: onPressed,
              child: Text(
                text,
                style: Styles.textsize20,
              )),
        ),
      ],
    );
  }
}
