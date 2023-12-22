import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/feature/Home/presention/view/widgets/search_cart_bar.dart';
import 'widgets/customBottomNavitem_method.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int numberwid = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Image.asset(Appassets.routeappbar),
          ),
          SliverToBoxAdapter(
              child: Column(children: [
            if (numberwid != 3)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0),
                child: search_cart_bart(),
              ),
            SizedBox(
              height: 7.h,
            ),
            screens[numberwid],
          ]))
        ],
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: Theme(
            data: ThemeData(canvasColor: maincolor),
            child: BottomNavigationBar(
                currentIndex: numberwid,
                showSelectedLabels: false, //selected item
                showUnselectedLabels: false, //uns
                onTap: (value) {
                  setState(() {
                    numberwid = value;
                  });
                },
                items: [
                  customBottomNavitem(
                      imgage: Appassets.home,
                      unselctedimgage: Appassets.sehome,
                      index: 0,
                      numberwid: numberwid),
                  customBottomNavitem(
                      imgage: Appassets.prodacts,
                      unselctedimgage: Appassets.seprodatc,
                      index: 1,
                      numberwid: numberwid),
                  customBottomNavitem(
                      imgage: Appassets.loved,
                      unselctedimgage: Appassets.selove,
                      index: 2,
                      numberwid: numberwid),
                  customBottomNavitem(
                      imgage: Appassets.setting,
                      unselctedimgage: Appassets.seSetting,
                      index: 3,
                      numberwid: numberwid),
                ]),
          )),
    );
  }
}
