import 'dart:developer';

import 'package:ecommerce_shop/data/categories.dart';
import 'package:ecommerce_shop/data/repo/home_repo.dart';
import 'package:ecommerce_shop/ui/home_screen/bloc/home_bloc.dart';
import 'package:ecommerce_shop/ui/product/product.dart';
import 'package:ecommerce_shop/utitlity/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/product.dart';
import '../../widget.dart/app_bar_icon.dart';
import '../../widget.dart/image_loading_servise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var withOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    double paddingSize = 8;
    return BlocProvider<HomeBloc>(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const SizedBox(
              width: 5,
            ),
            AppBarIcon(
                onTap: () {},
                borderRadius: BorderRadius.circular(500),
                icon: Icons.card_travel),
            const Expanded(
              child: SizedBox(),
            ),
            AppBarIcon(
              icon: Icons.menu,
              borderRadius: BorderRadius.circular(500),
              onTap: () {},
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (state is HomeSuccess) {
                log(state.allProduct.length.toString());
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // welcom section
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20, top: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       // Text(
                        //       //   'Mahdi',
                        //       //   style: Theme.of(context).textTheme.titleLarge,
                        //       // ),
                        //       // const SizedBox(
                        //       //   height: 8,
                        //       // ),
                        //       // Text('welcome to stylish app',
                        //       //     style: Theme.of(context).textTheme.bodySmall),
                        //     ],
                        //   ),
                        // ),

                        //search section

                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: paddingSize + 8),
                              width: withOfScreen * 0.78,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: 'Search...',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(70))),
                              ),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            IconButton(
                              padding: EdgeInsets.only(right: paddingSize),
                              onPressed: () {},
                              icon: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 151, 117, 250),
                                      shape: BoxShape.rectangle),
                                  child: const Icon(Icons.keyboard_voice)),
                              iconSize: 30,
                              color: Colors.white,
                            )
                          ],
                        ),

                        // categories section

                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              paddingSize + 5, 8, paddingSize + 5, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppString.homeCategories,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  AppString.homeviewall,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 143, 149, 158),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // categories sectopn

                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              paddingSize + 5, 5, paddingSize + 5, 5),
                          child: Container(
                            width: withOfScreen,
                            height: 60,

                            // color: Colors.amber,
                            child: ListView.builder(
                              //TODO: completer data source for give categories and complete this section
                              scrollDirection: Axis.horizontal,
                              itemCount: state.allCategories.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final item = state.allCategories[index];
                                return _CategoryItem(item: item , index: index);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // product section

                        Expanded(
                          child: GridView.builder(
                            itemCount: state.allProduct.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200, // عرض حداکثر هر آیتم
                              mainAxisSpacing:
                                  5, // فاصله در جهت عمودی بین آیتم‌ها
                              crossAxisSpacing:
                                  5, // فاصله در جهت افقی بین آیتم‌ها
                              childAspectRatio:
                                  0.6, // نسبت عرض به ارتفاع هر آیتم
                            ),
                            itemBuilder: (context, index) {
                              Product product = state.allProduct[index];
                              final String image =
                                  state.allProduct[index].images[index = 0];
                              return InkWell(
                                onTap: () => Navigator.of(context)
                                    .push(CupertinoPageRoute(
                                  builder: (context) =>
                                      ProductScreen(productDetail: product),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black38),
                                      borderRadius: BorderRadius.circular(35),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            child: ImageLoadingService(
                                              image: image,
                                              boxFit: BoxFit.fill,
                                              height: 200,
                                              width: 200,
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            product.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            maxLines: 1,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            product.description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            "\$${product.price.toString()} ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 5,
                        ),
                      ]),
                );
              } else if (state is HomeEror) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.appException.exceptionMessage),
                      SizedBox(
                          height: 50,
                          width: 170,
                          child: ElevatedButton(
                              onPressed: () {
                                context.read<HomeBloc>().add(HomeStarted());
                              },
                              child: const Text('try again '))),
                    ],
                  ),
                );
              } else {
                return Container(
                  color: Colors.blueAccent,
                ); // Default return statement
              }
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    super.key,
    required this.item, required this.index,
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
              borderRadius: const BorderRadius.all(
                  Radius.circular(12)),
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
