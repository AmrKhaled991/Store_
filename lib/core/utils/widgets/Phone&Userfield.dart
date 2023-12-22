// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store/core/utils/Global_utls/Styles.dart';

class Phone_userfiekd extends StatelessWidget {
  TextEditingController controller;
  String name;
  String hinttext;
  TextInputType textInputType;
  Phone_userfiekd({
    Key? key,
    required this.controller,
    required this.name,
    required this.hinttext,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: Styles.textsizewhite18),
        SizedBox(
          height: 15.h,
        ),
        TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hinttext,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
            keyboardType: textInputType,
            controller: controller,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'enter vaild value';
              }
              return null;
            })
      ],
    );
  }
}
