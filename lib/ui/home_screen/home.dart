import 'dart:ffi';

import 'package:ecommerce_shop/data/repo/home_repo.dart';
import 'package:ecommerce_shop/ui/home_screen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget.dart/app_bar_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            } else if (state is HomeSuccess) {
              return Container(
                width: MediaQuery.of(context).size.width,

                // color: Colors.redAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // welcom section
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mahdi',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text('welcome to stylish app',
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ),

                    //search section

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: paddingSize + 8),
                          width: withOfScreen * 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search...',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70))),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 151, 117, 250),
                                  shape: BoxShape.rectangle),
                              child: Icon(Icons.keyboard_voice)),
                          iconSize: 30,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
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
