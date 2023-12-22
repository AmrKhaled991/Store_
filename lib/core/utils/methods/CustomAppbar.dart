import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/Global_utls/approuter.dart';

AppBar CustomAppbar(BuildContext context) {
  return AppBar(
      centerTitle: true,
      title: Text(
        'Product Details',
        style: Styles.textsize20,
      ),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back_rounded,
          color: maincolor,
        ),
      ),
      actions: [
        InkWell(
          onTap: () => context.push(AppRouter.cart),
          child: Image.asset(
            Appassets.cart,
            width: 24,
          ),
        ),
        SizedBox(
          width: 16,
        ),
      ]);
}

AppBar CartAppbar(BuildContext context) {
  return AppBar(
      centerTitle: true,
      title: Text(
        'Cart',
        style: Styles.textsize20,
      ),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back_rounded,
          color: maincolor,
        ),
      ));
}
