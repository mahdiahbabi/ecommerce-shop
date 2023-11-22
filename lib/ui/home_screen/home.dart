import 'package:ecommerce_shop/data/repo/home_repo.dart';
import 'package:ecommerce_shop/ui/home_screen/bloc/home_bloc.dart';
import 'package:ecommerce_shop/utitlity/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
     child: Scaffold(
  appBar: AppBar(),
  body: BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state is HomeLoading) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.blue),
        );
      } else if (state is HomeSuccess) {
        return Container(
          color: Colors.redAccent,
        );
      } else if (state is HomeEror) {
        return Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('try'))
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
