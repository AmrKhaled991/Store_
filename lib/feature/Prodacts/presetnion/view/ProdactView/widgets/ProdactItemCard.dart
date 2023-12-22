// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/Global_utls/approuter.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';

import 'widgets/photos_product.dart';
import 'widgets/productitmecard_rowof_addbuttom.dart';

class ProdactItemCard extends StatelessWidget {
  ProductModel productModel;
  int index;
  ProdactItemCard({
    Key? key,
    required this.productModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRouter.kitemdetiels, extra: productModel),
      child: Card(
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: maincolor),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Photos_product(productModel: productModel),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: Text(
                    productModel.titel!,
                    style: Styles.textsize14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'EGP ${productModel.price}',
                  style: Styles.textsize14,
                ),
                const SizedBox(
                  height: 3,
                ),
                Productitmecard_rowofAddbuttom(
                    productModel: productModel, index: index),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
