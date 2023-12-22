// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store/core/utils/Global_utls/Styles.dart';

class Passwordfield extends StatefulWidget {
  TextEditingController controller;
  Passwordfield({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<Passwordfield> createState() => _PasswordfieldState();
}

class _PasswordfieldState extends State<Passwordfield> {
  bool visable = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('password', style: Styles.textsizewhite18),
        SizedBox(
          height: 16.h,
        ),
        TextFormField(
          obscureText: visable,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                    visable == true ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    visable = !visable;
                  });
                },
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'please enter your password',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'enter value';
            }
            if (value.length < 6) {
              return 'password unvalid';
            }
            return null;
          },
        )
      ],
    );
  }
}
