// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

class Prodact_color extends StatefulWidget {
  const Prodact_color({super.key});

  @override
  State<Prodact_color> createState() => _ProdactcolorState();
}

class _ProdactcolorState extends State<Prodact_color> {
  int piceditem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Styles.textsize18,
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
            height: 35.h,
            child: ListView.builder(
              itemCount: listcolor.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  setState(() {
                    piceditem = index;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: listcolor[index],
                  radius: 22.r,
                  child: piceditem == index
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            )),
      ],
    );
  }
}

List<Color> listcolor = [
  Colors.brown,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange.shade400
];
