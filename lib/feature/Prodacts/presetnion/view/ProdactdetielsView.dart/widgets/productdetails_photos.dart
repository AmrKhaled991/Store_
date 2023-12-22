import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';

class ProductdetailsPhotos extends StatelessWidget {
  const ProductdetailsPhotos({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlayInterval: Duration(seconds: 3),
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      items: productModel.photos!
          .map(
            (e) => ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: CachedNetworkImage(
                height: MediaQuery.sizeOf(context).height / 3,
                imageUrl: e,
                errorWidget: (context, url, error) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: const CircleAvatar(radius: 50),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
