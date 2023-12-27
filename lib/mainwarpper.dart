import 'package:ecommerce_shop/ui/cart/cart.dart';
import 'package:ecommerce_shop/ui/home_screen/home.dart';
import 'package:ecommerce_shop/ui/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final myList = [const HomeScreen(), const CartScreen(), ProfileScreen()];

class MainWarpper extends StatefulWidget {
  @override
  State<MainWarpper> createState() => _MainWarpperState();
}

class _MainWarpperState extends State<MainWarpper> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: const Column(
                  children: [
                    Icon(Icons.home),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Home'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: const Column(
                  children: [
                    Icon(Icons.card_travel),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Cart'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: const Column(
                  children: [
                    Icon(Icons.person_2),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Profile'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.redAccent,
          child: selectableIndex(selectedIndex),
        ),
      ),
    );
  }
}

Widget selectableIndex(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return myList[0];
      break;
    case 1:
      return myList[1];
      break;
    case 2:
      return myList[2];
      break;
    default:
      return myList[0];
  }
}
