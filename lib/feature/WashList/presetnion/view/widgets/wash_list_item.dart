import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

class WashList_item extends StatelessWidget {
  const WashList_item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        padding: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: maincolor)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                Appassets.splashScreen,
                width: 110.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nike Air Jordon',
                        style: Styles.textsize18,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(Appassets.delete, height: 20.h),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 7,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Oreange|Size 24')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'EGP 3,500',
                        style: Styles.textsize18,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(110.w, 30.h),
                              backgroundColor: maincolor),
                          child: Text(
                            'Add Cart',
                            style: Styles.textwhitesize14,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
