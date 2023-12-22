// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store/core/utils/Global_utls/Styles.dart';

import 'widgets/editinformationtextfield.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Welcome, Mohamed',
          style: Styles.textsize18,
        ),
        Text(
          'mohamed.N@gmail.com',
          style: Styles.textsize14,
        ),
        SizedBox(
          height: 30.h,
        ),
        Editinformationtextfield(
            title: 'Your Fall Name', informaion: 'Mohamed Mohamed Nabil'),
        SizedBox(
          height: 10.h,
        ),
        Editinformationtextfield(
            title: 'Your E-mail', informaion: 'mohamed.N@gmail.com'),
        SizedBox(
          height: 10.h,
        ),
        Editinformationtextfield(
            title: 'Your password', informaion: '**********************'),
        SizedBox(
          height: 10.h,
        ),
        Editinformationtextfield(
            title: 'Your mobile number', informaion: '01122118855'),
        SizedBox(
          height: 10.h,
        ),
        Editinformationtextfield(
            title: 'Your Address', informaion: '6th October, street 11'),
        SizedBox(
          height: 10.h,
        ),
      ]),
    );
  }
}
