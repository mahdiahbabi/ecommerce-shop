// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:ecommerce_shop/data_base/productdata.dart';
import 'package:ecommerce_shop/widget.dart/image_loading_servise.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../data/product.dart';

class ProductScreen extends StatefulWidget {
  final Product productDetail;
  const ProductScreen({super.key, required this.productDetail});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var box = Hive.box<ProductData>('product');
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(backgroundColor: Colors.blueAccent,
        onPressed: () async {
          ProductData productData = ProductData(
            widget.productDetail.id,
            widget.productDetail.title,
            widget.productDetail.price,
            widget.productDetail.description,
            widget.productDetail.images,
            widget.productDetail.categoryId,
            widget.productDetail.categoryName,
            widget.productDetail.categoryImage,
            1,
          );
          if (box.values.any((element) => element.id == productData.id)) {
              var exsistingproducts = box.values.firstWhere(
            (element) => productData.id == element.id,
            
          );
             ProductData productDataUpdate = ProductData(
              widget.productDetail.id,
              widget.productDetail.title,
              widget.productDetail.price,
              widget.productDetail.description,
              widget.productDetail.images,
              widget.productDetail.categoryId,
              widget.productDetail.categoryName,
              widget.productDetail.categoryImage,
              exsistingproducts.amount + 1,
            );
  await box.put(exsistingproducts.key, productDataUpdate);
          }else{
 await box.add(productData);
          }


          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('success add to cart')));
        },
        label: const Text('Add To Cart'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                // image on top of page
                Stack(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 3,
                        child: ImageLoadingService(
                          height: 200,
                          width: 200,
                          image: widget.productDetail.images[selectedIndex],
                          boxFit: BoxFit.fill,
                        )),
                    Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.card_travel,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productDetail.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Column(
                            children: [
                              Text(
                                'price',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                widget.productDetail.price.toString(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),

                // List of images
                SizedBox(
                  height: 130,
                  width: 400,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.productDetail.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final image = widget.productDetail.images[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                border: selectedIndex == index
                                    ? Border.all(color: Colors.blue, width: 1.5)
                                    : null,
                                // shape: selectedIndex == index ? BoxShape.circle : BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(
                                    selectedIndex == index ? 50 : 25)),
                            // margin: const EdgeInsets.all(10),

                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    selectedIndex == index ? 50 : 25),
                                child: ImageLoadingService(
                                  width: 200,
                                  height: 200,
                                  image: image,
                                  boxFit: BoxFit.fill,
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('description'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: SizedBox(
                    height: 250,
                    child: ExpandableText(
                      widget.productDetail.description * 3,
                      expandText: 'Show more',
                      collapseText: 'Show less',
                      maxLines: 1,
                      linkColor: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
