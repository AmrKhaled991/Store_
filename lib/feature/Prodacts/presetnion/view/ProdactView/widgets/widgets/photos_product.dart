// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';

class Photos_product extends StatefulWidget {
  Photos_product({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<Photos_product> createState() => _Photos_productState();
}

class _Photos_productState extends State<Photos_product> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: CachedNetworkImage(
          height: 128,
          fit: BoxFit.fill,
          width: double.maxFinite,
          imageUrl: widget.productModel.cover!,
          errorWidget: (context, url, error) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: const CircleAvatar(radius: 50),
          ),
        ),
      ),
      Positioned(
        right: -2.4,
        top: 8,
        child: InkWell(
          onTap: () {
            setState(() {
              select = !select;
            });
          },
          child: select == false
              ? Image.asset(
                  Appassets.like,
                )
              : Image.asset(
                  Appassets.unlike,
                ),
        ),
      )
    ]);
  }
}
