import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/Global_utls/approuter.dart';

class search_cart_bart extends StatelessWidget {
  const search_cart_bart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              hintText: 'what do you search for?',
              hintStyle: Styles.textsize14.copyWith(color: Colors.grey),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Tab(
                  icon: new Image.asset(Appassets.search),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: maincolor),
                borderRadius: BorderRadius.circular(25),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: maincolor),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          )),
          const SizedBox(
            width: 7,
          ),
          InkWell(
              onTap: () => context.push(AppRouter.cart),
              child: Image.asset(
                Appassets.cart,
                height: 24.h,
              ))
        ],
      ),
    );
  }
}
