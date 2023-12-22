import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/wash_list_item.dart';

class WashListview extends StatelessWidget {
  const WashListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 13),
      itemBuilder: (_, index) => WashList_item(),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20.h,
      ),
      itemCount: 3,
    );
  }
}
