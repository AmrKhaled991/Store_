// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:store/core/utils/Global_utls/Styles.dart';

class CategoryItem extends StatelessWidget {
  String imga;
  String text;
  CategoryItem({
    Key? key,
    required this.imga,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: imga,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Shimmer.fromColors(
              child: CircleAvatar(radius: 50),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
            ),
            height: 100,
            width: 100,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.clip,
          style: Styles.textsize14,
        ),
      ],
    );
  }
}
