import 'package:ecommerce_shop/widget.dart/image_loading_servise.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../data/product.dart';

class ProductScreen extends StatefulWidget {
  final Product productDetail;
  const ProductScreen({required this.productDetail});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        
      }, label: const Text('Add To Cart'),
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  child: ImageLoadingService(
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
                          onPressed: () {},
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
          SizedBox(
            height: 130,
            width: 400,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
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
                            image: image,
                            boxFit: BoxFit.fill,
                          )),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: const Text('description'),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,2,10,2),
            child: Container(
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
         SizedBox(
          height: 30,
         ),
              ],
          ),
        ),
      ),
    );
  }
}
