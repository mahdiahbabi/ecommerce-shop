

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/product.dart';

class ImageLoadingService extends StatelessWidget {
  const ImageLoadingService({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: product.categoryImage,
      height: 200,
      width: 200,
      fit: BoxFit.fill,
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
