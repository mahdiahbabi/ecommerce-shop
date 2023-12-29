import 'package:ecommerce_shop/data_base/productdata.dart';
import 'package:ecommerce_shop/ui/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_shop/ui/profile/profile.dart';
import 'package:ecommerce_shop/widget.dart/image_loading_servise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(CheckOutButton());
            },
            label: const Text('Check Out')),
        backgroundColor: Colors.white,
        body: BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) {
            return current is CartSuccess || current is CartLoading;
          },
          builder: (context, state) {
            return SafeArea(
                child: box.values.toList().isNotEmpty
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.arrow_back)),
                              const Text('Cart'),
                              const SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 1.7,
                            child: ListView.builder(
                              itemCount: box.values.toList().length,
                              itemBuilder: (context, index) {
                                var item = box.values.toList()[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: index % 2 == 0
                                              ? const Color.fromRGBO(
                                                  241, 234, 234, 0.808)
                                              : const Color.fromARGB(
                                                  26, 213, 203, 203),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        height: 130,
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: ImageLoadingService(
                                                  image: item.images.first,
                                                  boxFit: BoxFit.fill,
                                                  height: 120,
                                                  width: 110),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: SizedBox(
                                                width: 200,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item.title,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(item.description,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis),
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
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                              BlocProvider.of<
                                                                          CartBloc>(
                                                                      context)
                                                                  .add(
                                                                      CartIncreaseDecreseButton(
                                                                          index,
                                                                          1));
                                                            },
                                                            color: Colors.grey,
                                                            icon: const Icon(Icons
                                                                .arrow_upward)),
                                                        state is CartLoading
                                                            ? const CircularProgressIndicator()
                                                            : Text(item.amount
                                                                .toString()),
                                                        IconButton(
                                                            onPressed: () {
                                                              BlocProvider.of<
                                                                          CartBloc>(
                                                                      context)
                                                                  .add(
                                                                      CartIncreaseDecreseButton(
                                                                          index,
                                                                          1));
                                                            },
                                                            color: Colors.grey,
                                                            icon: const Icon(Icons
                                                                .arrow_downward)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<CartBloc>(
                                                          context)
                                                      .add(ItemDelete(index));
                                                },
                                                icon: const Icon(Icons.delete)),
                                          ],
                                        )),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Order Info'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Subtotal'),
                                    Text(
                                        '\$${calCulatetotal(box.values.toList())}'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Delivery Charge'),
                                    Text('\$' +
                                        '${calCulatetotal(box.values.toList()) * 0.1} '),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Total'),
                                    Text(
                                        '\$${calCulatetotal(box.values.toList()) + calCulatetotal(box.values.toList()) * 0.1}'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    : SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset('assets/preview.png'),
                      ));
          },
        ),
      ),
    );
  }
}

int calCulatetotal(List<ProductData> product) {
  int m = 0;
  for (var element in product) {
    m += element.price * element.amount;
  }
  return m;
}
