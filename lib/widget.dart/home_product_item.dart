


import 'package:ecommerce_shop/data/product.dart';
import 'package:ecommerce_shop/ui/product/product.dart';
import 'package:ecommerce_shop/widget.dart/image_loading_servise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrudoctItems extends StatelessWidget {
  const PrudoctItems({
    super.key,
    required this.product,
    required this.image,
  });

  final Product product;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => ProductScreen(productDetail: product),
      )),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black38),
            borderRadius: BorderRadius.circular(35),
            // color: const Color.fromARGB(255, 218, 24, 24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: ImageLoadingService(
                    image: image,
                    boxFit: BoxFit.fill,
                    height: 180,
                    width: 175,
                  )),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "\$${product.price.toString()} ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
