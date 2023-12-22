import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/methods/customsnackbar.dart';
import 'package:store/feature/Prodacts/presetnion/manger/Fetchproductcubit/product_cubit.dart';
import 'package:store/feature/Prodacts/presetnion/view/ProdactView/widgets/ProdactItemCard.dart';
import 'widgets/widgets/shimmer_product_item.dart';

class Prodactsview extends StatelessWidget {
  const Prodactsview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(builder: (_, state) {
      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          if (state is ProductSucsses) {
            return ProdactItemCard(
              index: index,
              productModel: state.productlist[index],
            );
          } else if (state is Productlodaing) {
            return ShimmerProductItem();
          }
        },
        itemCount: state is ProductSucsses ? 20 : 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      );
    }, listener: (_, state) {
      if (state is ProductError) showSnackBar(context, state.error, Colors.red);
    });
  }
}
