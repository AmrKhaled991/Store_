import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/Home/presention/manger/cubit/home_cubit.dart';
import 'package:store/feature/Home/presention/view/widgets/CutomItemPartionlist.dart';

import 'shimmer_category_item.dart';

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        print('halll');
        return Container(
          height: 316,
          child: GridView.builder(
              padding: const EdgeInsets.only(left: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //المساحه بين ال items
                mainAxisExtent: 100,
                crossAxisSpacing: 16,
                mainAxisSpacing: 12,
                crossAxisCount: 2,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext, index) =>
                  (state is HomeCategoriesSucsses)
                      ? CategoryItem(
                          imga: state.listcat[index].photo,
                          text: state.listcat[index].title,
                        )
                      : ShimmerCategoryItem()),
        );
      },
    );
  }
}
