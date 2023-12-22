// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';
import 'package:store/feature/Cart/presention/manger/cubit/HivecartCubit.dart';

import 'CartItemRowPrice.dart';

class CartItem extends StatelessWidget {
  int index;
  CartItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modelcart modelcart =
        BlocProvider.of<HivecartCubit>(context).models.getAt(index)!;
    return Container(
        padding: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: maincolor)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                width: 100.w,
                height: 95.h,
                fit: BoxFit.cover,
                imageUrl: modelcart!.image,
                errorWidget: (context, url, error) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: const CircleAvatar(radius: 50),
                ),
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
                      SizedBox(
                        width: 180.w,
                        child: Text(
                          modelcart.titel!,
                          style: Styles.textsize18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          BlocProvider.of<HivecartCubit>(context)
                              .delteitem(index);
                        },
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
                  CartItemRowPrice(modelcart: modelcart, index: index)
                ],
              ),
            )
          ],
        ));
  }
}
