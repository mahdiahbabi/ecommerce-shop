// ignore_for_file: unnecessary_import

import 'dart:developer';
import 'package:ecommerce_shop/data/repo/home_repo.dart';
import 'package:ecommerce_shop/ui/home_screen/bloc/home_bloc.dart';
import 'package:ecommerce_shop/utitlity/string.dart';
import 'package:ecommerce_shop/widget.dart/home_category_item.dart';
import 'package:ecommerce_shop/widget.dart/home_product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/product.dart';
import '../../widget.dart/app_bar_icon.dart';

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
        body: BlocBuilder<HomeBloc, HomeState>(
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
                                      borderRadius: BorderRadius.circular(70))),
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

                      // categories sectipn

                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    paddingSize + 5, 5, paddingSize + 5, 5),
                                child: SizedBox(
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
                                      return CategoryItem(
                                          item: item, index: index);
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
                                    maxCrossAxisExtent:
                                        220, // عرض حداکثر هر آیتم
                                    mainAxisSpacing:
                                        5, // فاصله در جهت عمودی بین آیتم‌ها
                                    crossAxisSpacing:
                                        5, // فاصله در جهت افقی بین آیتم‌ها
                                    childAspectRatio:
                                        0.67, // نسبت عرض به ارتفاع هر آیتم
                                  ),
                                  itemBuilder: (context, index) {
                                    Product product = state.allProduct[index];
                                    final String image = state
                                        .allProduct[index].images[index = 0];
                                    return PrudoctItems(
                                        product: product, image: image);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
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
    );
  }
}
