import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/Global_utls/Styles.dart';
import 'package:store/core/utils/methods/CustomAppbar.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';
import 'package:store/feature/Prodacts/presetnion/view/ProdactdetielsView.dart/widgets/prodact__size.dart';
import 'widgets/ItemCounter_review_Row.dart';
import 'widgets/custom__prodact__price__elvatedbuttom.dart';
import 'widgets/prodact_color.dart';
import 'widgets/prodact_descrption.dart';
import 'widgets/productdetails_photos.dart';

class Prodactdetieles extends StatelessWidget {
  ProductModel productModel;
  Prodactdetieles({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductdetailsPhotos(productModel: productModel),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 230.w,
                    child: Text(
                      productModel.titel!,
                      style: Styles.textsize18,
                    ),
                  ),
                  Text(
                    'EGP /${productModel.price}',
                    style: Styles.textsize18,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ItemCounter_review_Row(
                  rating: productModel.ratingsAverage!,
                  sold: productModel.sold!),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Description',
                style: Styles.textsize18,
              ),
              SizedBox(
                height: 8.h,
              ),
              (productModel.description == null ||
                      productModel.description!.isEmpty)
                  ? Text(
                      'no description',
                      style: Styles.textsize14,
                    )
                  : ProdactDescrption(text: productModel.description!),
              SizedBox(
                height: 16.h,
              ),
              Prodact_Size(),
              Prodact_color(),
              SizedBox(
                height: 25.h,
              ),
              Custom_Prodact_Price_Elvatedbuttom(
                productModel: productModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
