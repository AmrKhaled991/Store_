import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/methods/CustomAppbar.dart';
import 'package:store/feature/Cart/presention/manger/cubit/HivecartCubit.dart';

import 'widgets/cart_item.dart';
import 'widgets/customflotingbuttomcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HivecartCubit, HiveCartState>(
        builder: (context, state) =>
            BlocProvider.of<HivecartCubit>(context).models.length == 0
                ? Scaffold(
                    appBar: CartAppbar(context),
                    body: Container(
                      child: Center(child: Text('Try to add itmes please')),
                    ))
                : Scaffold(
                    appBar: CartAppbar(context),
                    body: ListView.separated(
                      padding:
                          EdgeInsets.only(bottom: 100.h, left: 16, right: 16),
                      itemBuilder: (_, index) => CartItem(index: index),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 20.h,
                      ),
                      itemCount:
                          BlocProvider.of<HivecartCubit>(context).models.length,
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerFloat,
                    floatingActionButton: Customflotingbuttomcart(),
                  ));
  }
}
