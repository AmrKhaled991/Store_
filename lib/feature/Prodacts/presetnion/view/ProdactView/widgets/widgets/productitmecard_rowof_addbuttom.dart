// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';
import 'package:store/feature/Cart/presention/manger/cubit/HivecartCubit.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';

class Productitmecard_rowofAddbuttom extends StatelessWidget {
  int index;
  Productitmecard_rowofAddbuttom({
    Key? key,
    required this.index,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Review(${productModel.quntity})',
            style: Styles.textsize12,
          ),
          Icon(
            Icons.star_outlined,
            size: 20,
            color: Colors.yellow.shade600,
          ),
          Spacer(),
          InkWell(
            onTap: () {
              BlocProvider.of<HivecartCubit>(context).addtocart(
                  modelcart: Modelcart(
                      image: productModel.cover!,
                      price: productModel.price,
                      quntity: 1,
                      titel: productModel.titel),
                  numberofproduct: index);
            },
            child: BlocBuilder<HivecartCubit, HiveCartState>(
              builder: (context, state) {
                if (state is HiveAddporductlist) {
                  Future.delayed(Duration(seconds: 2), () {
                    BlocProvider.of<HivecartCubit>(context)
                        .emit(HiveCartInitial());
                  });
                }
                if (state is HiveAddporductlist) {
                  return state.index == index
                      ? Image.asset(
                          Appassets.Paymentsucsses,
                          width: 30,
                        )
                      : Image.asset(
                          Appassets.add,
                          width: 30,
                        );
                }
                return Image.asset(
                  Appassets.add,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
