

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/product.dart';

class ImageLoadingService extends StatelessWidget {
  const ImageLoadingService({
    super.key, required this.image, required this.boxFit,
   
  });

  final String image;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: 200,
      width: 200,
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
