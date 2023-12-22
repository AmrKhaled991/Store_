import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/feature/Home/presention/view/widgets/HomescreenUppart.dart';

import 'brand__home.dart';
import 'categories_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HomescreenUppart(),
        SizedBox(
          height: 10.h,
        ),
        CategoriesHome(),
        const SizedBox(
          height: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Home brands',
                style: Styles.textsize18,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Brand_Home(),
            SizedBox(
              height: 16.h,
            ),
          ],
        )
      ],
    );
  }
}
