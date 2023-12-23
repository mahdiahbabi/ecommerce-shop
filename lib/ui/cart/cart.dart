import 'package:ecommerce_shop/data_base/productdata.dart';
import 'package:ecommerce_shop/ui/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_shop/ui/profile/profile.dart';
import 'package:ecommerce_shop/widget.dart/image_loading_servise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box<ProductData>('product');
    return BlocProvider<CartBloc>(
      create: (context) {
        var cartBloc = CartBloc();
        cartBloc.stream.forEach((state) {
          if (state is CartCheckOytSuccess) {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => ProfileScreen(),
            ));
          } else if (state is CartEror) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.appException.exceptionMessage)));
          }
        });
        cartBloc.add(CartStarted());
        return cartBloc;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) {
            return current is  CartSuccess;
          },
          builder: (context, state) {
            return SafeArea(
                child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back)),
                    Text('Cart'),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                    itemCount: box.values.toList().length,
                    itemBuilder: (context, index) {
                      var item = box.values.toList()[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? Color.fromRGBO(241, 234, 234, 0.808)
                                  : Color.fromARGB(26, 213, 203, 203),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 130,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: ImageLoadingService(
                                      image: item.images.first,
                                      boxFit: BoxFit.fill,
                                      height: 120,
                                      width: 110),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: SizedBox(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(item.description,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: Text(
                                            '\$${item.price}',
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                color: Colors.grey,
                                                icon: Icon(Icons.arrow_upward)),
                                            Text('1'),
                                            IconButton(
                                                onPressed: () {},
                                                color: Colors.grey,
                                                icon:
                                                    Icon(Icons.arrow_downward)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                     CartBloc().add(ItemDelete(index));

                                    },
                                    icon: const Icon(Icons.delete)),
                              ],
                            )),
                      );
                    },
                  ),
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
