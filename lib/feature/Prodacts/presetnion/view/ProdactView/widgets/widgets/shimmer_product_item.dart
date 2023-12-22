// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

class ShimmerProductItem extends StatelessWidget {
  const ShimmerProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Container(
                height: 128,
                width: double.maxFinite,
                child: Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: SizedBox(
                  height: 40,
                  child: Text(
                    'loading',
                    style: Styles.textsize14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: Text(
                  'EGP loding ',
                  style: Styles.textsize14,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: Text(
                        'Review(loding)',
                        style: Styles.textsize12,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
