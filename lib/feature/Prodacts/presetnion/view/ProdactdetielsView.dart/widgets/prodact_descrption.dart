// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/constant.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';

class ProdactDescrption extends StatefulWidget {
  String text;

  ProdactDescrption({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ProdactDescrption> createState() => _ProdactDescrptionState();
}

class _ProdactDescrptionState extends State<ProdactDescrption> {
  String textincres = '';
  String text50 = '';
  bool readmore = true;
  @override
  void initState() {
    if (widget.text.length > 120) {
      text50 = widget.text.substring(0, 120);
      textincres = widget.text.substring(120, widget.text.length);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width - 70.w,
        child: textincres.isEmpty
            ? Text(
                "$text50",
                maxLines: 3,
                style: Styles.textsize14,
              )
            : RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: readmore ? text50 : (text50 + textincres),
                      style: Styles.textsize14.copyWith(color: maincolor),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            readmore = !readmore;
                          });
                        },
                      text: readmore ? '....Read More' : '  Read less',
                      style: Styles.textsize14,
                    )
                  ],
                ),
              ));
  }
}
