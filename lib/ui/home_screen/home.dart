

import 'package:ecommerce_shop/data/repo/home_repo.dart';
import 'package:ecommerce_shop/utitlity/string.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState()  {
    homeRepository.getAll();
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(AppString.homeTitleText),
    ),
  );
  }
}