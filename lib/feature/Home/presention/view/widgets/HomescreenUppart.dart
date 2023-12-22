import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

class HomescreenUppart extends StatelessWidget {
  const HomescreenUppart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 389 / 200,
              autoPlayInterval: Duration(seconds: 3),
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
            items: slidephotos.map((e) => Image.asset(e)).toList(),
          ),
          SizedBox(
            height: 7.h,
          ),
          SizedBox(
            height: 24.h,
            child: Row(
              children: [
                Text('Categories', style: Styles.textsize18),
                const Spacer(),
                Text('view all', style: Styles.textsize12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
