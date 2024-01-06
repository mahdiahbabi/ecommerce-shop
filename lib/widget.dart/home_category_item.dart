
import 'package:ecommerce_shop/data/categories.dart';
import 'package:ecommerce_shop/widget.dart/image_loading_servise.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.item,
    required this.index,
  });
  final int index;
  final Categories item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(left: 10),
      width: 175,
      height: 50,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: ImageLoadingService(
                  image: item.image,
                  boxFit: BoxFit.cover,
                  height: 60,
                  width: 55)),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 90,
            child: Text(
              item.name,
              // style: theme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
