// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

class ShimmerCategoryItem extends StatelessWidget {
  const ShimmerCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            child: null,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'loading',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: Styles.textsize14,
          ),
        ],
      ),
    );
  }
}
