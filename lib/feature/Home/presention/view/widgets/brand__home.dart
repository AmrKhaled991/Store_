import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/Global_utls/Appassets.dart';
import 'package:store/feature/Home/presention/manger/cubit/home_cubit.dart';

class Brand_Home extends StatelessWidget {
  const Brand_Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 122.h,
        child: BlocBuilder<BrandCubit, HomeState>(builder: (context, state) {
          return ListView.separated(
              padding: const EdgeInsets.only(left: 16),
              separatorBuilder: (BuildContext, idex) => SizedBox(
                    width: 16.w,
                  ),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (BuildContext, idex) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: Image.asset(
                    Appassets.slide1,
                    fit: BoxFit.fill,
                    width: 158,
                  ),
                );
              });
        }));
  }
}
