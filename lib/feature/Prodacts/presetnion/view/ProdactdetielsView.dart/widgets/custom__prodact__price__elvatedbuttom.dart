// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/countercubit/cubit/counter_cubit.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';
import 'package:store/feature/Cart/presention/manger/cubit/HivecartCubit.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';
import '../../../../../../core/utils/widgets/totalprice_widget.dart';

class Custom_Prodact_Price_Elvatedbuttom extends StatelessWidget {
  ProductModel productModel;
  Custom_Prodact_Price_Elvatedbuttom({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Totalprice_widget(price: productModel.price!),
        const Spacer(),
        BlocBuilder<HivecartCubit, HiveCartState>(
          builder: (context, state) {
            return ElevatedButton(
                key: ValueKey(productModel.id),
                onPressed: () {
                  BlocProvider.of<HivecartCubit>(context).addtocart(
                      modelcart: Modelcart(
                          image: productModel.cover!,
                          price: productModel.price,
                          quntity:
                              BlocProvider.of<CounterCubit>(context).counter,
                          titel: productModel.titel));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: maincolor, fixedSize: Size(200.w, 47.h)),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 7.w,
                  ),
                  child: BlocBuilder<HivecartCubit, HiveCartState>(
                    builder: (context, state) {
                      if (state is HiveCartADD || state is HiveAddporductlist)
                        Future.delayed(Duration(seconds: 2), () {
                          BlocProvider.of<HivecartCubit>(context)
                              .emit(HiveCartInitial());
                        });

                      return (state is HiveCartADD ||
                              state is HiveAddporductlist)
                          ? Image.asset(Appassets.Paymentsucsses)
                          : Row(
                              children: [
                                Image.asset(Appassets.cart2),
                                SizedBox(
                                  width: 16.w,
                                ),
                                const Text(
                                  'Add to cart',
                                  style: Styles.textsizewhite20,
                                )
                              ],
                            );
                    },
                  ),
                ));
          },
        )
      ],
    );
  }
}
