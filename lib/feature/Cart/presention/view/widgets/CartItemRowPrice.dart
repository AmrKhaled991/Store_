// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';
import 'package:store/feature/Cart/presention/manger/cubit/HivecartCubit.dart';

class CartItemRowPrice extends StatefulWidget {
  final int index;
  const CartItemRowPrice({
    super.key,
    required this.modelcart,
    required this.index,
  });

  final Modelcart modelcart;

  @override
  State<CartItemRowPrice> createState() => _CartItemRowPriceState();
}

class _CartItemRowPriceState extends State<CartItemRowPrice> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '${widget.modelcart.price!} EGP',
        style: Styles.textsize18,
      ),
      Container(
        height: 37.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: maincolor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () async {
                  BlocProvider.of<HivecartCubit>(context)
                      .removefromitem(widget.index);
                  setState(() {});
                },
                icon: Icon(
                  Icons.remove_circle_outline_outlined,
                  size: 24.r,
                  color: Colors.white,
                )),
            Text(
              widget.modelcart!.quntity.toString(),
              style: Styles.textsizewhite18,
            ),
            IconButton(
                onPressed: () async {
                  BlocProvider.of<HivecartCubit>(context)
                      .addtoitem(index: widget.index);

                  setState(() {});
                },
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  size: 24.r,
                  color: Colors.white,
                )),
          ],
        ),
      )
    ]);
  }
}
