import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

// ignore: must_be_immutable
class Emailfieald extends StatelessWidget {
  Emailfieald({super.key, required this.controller});
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: Styles.textsizewhite18),
        SizedBox(
          height: 15.h,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'please enter your eamil',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          controller: controller,
          validator: (value) {
            final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value ?? '');
            if (value == null || value.trim().isEmpty) {
              return 'inter value';
            }
            if (!emailValid) {
              return 'plz enter valid email';
            }
            return null;
          },
        )
      ],
    );
  }
}
