import 'package:flutter/material.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/feature/Home/presention/view/widgets/HomevView.dart';
import 'package:store/feature/Prodacts/presetnion/view/ProdactView/Prodactsview.dart';
import 'package:store/feature/Setting/presention/view/SettingView.dart';
import 'package:store/feature/WashList/presetnion/view/WashListview.dart';

List<Widget> screens = [
  const HomeView(),
  const Prodactsview(),
  const WashListview(),
  const SettingView()
];

List<String> slidephotos = [
  Appassets.slide1,
  Appassets.slide2,
  Appassets.slide3,
];
final Color maincolor = Color(0xff004182);
final Color textcolor = Color(0xff06004F);
final Color textcolor2 = Color(0xff06004F).withOpacity(.7);
