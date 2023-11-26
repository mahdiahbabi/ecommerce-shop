import 'package:ecommerce_shop/widget.dart/image_loading_servise.dart';
import 'package:flutter/material.dart';

import '../../data/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/3,
                  child: ImageLoadingService(image: product.images[0],boxFit: BoxFit.fill,)),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      // color: Colors.red,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () {
                            
                          }, icon: Icon(Icons.arrow_back, color:Colors.white ,size: 30,)),
                          IconButton(onPressed:  (){}, icon: Icon(Icons.card_travel,color: Colors.white,size: 30,)),
                        ],
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              width: 350,
              // color: Colors.brown,
              child: 
              ListView.builder(
                itemCount: product.images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                final image = product.images[index];
                return Container(
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.all(10),
                  // color: Colors.redAccent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: ImageLoadingService(image: image,boxFit: BoxFit.fill,)),
                );
              },),
            )
          ],
                ),
              )),
    );
  }
}
