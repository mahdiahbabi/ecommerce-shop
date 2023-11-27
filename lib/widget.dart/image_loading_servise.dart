

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/product.dart';

class ImageLoadingService extends StatelessWidget {
  const ImageLoadingService({
    super.key, required this.image, required this.boxFit, required this.height, required this.width,
   
  });

  final String image;
  final BoxFit boxFit;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: boxFit,
      placeholder: (context, url) {
        return const CircularProgressIndicator();
      },
      errorWidget: (context, url, error) {
        return const Icon(
            Icons.face_2_sharp);
      },
    );
  }
}
