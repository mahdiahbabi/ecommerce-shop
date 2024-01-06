import 'package:ecommerce_shop/ui/cart/cart.dart';
import 'package:ecommerce_shop/ui/home_screen/home.dart';
import 'package:ecommerce_shop/ui/profile/profile.dart';
import 'package:ecommerce_shop/widget.dart/bottm_nav.dart';
import 'package:flutter/material.dart';

final myList = [const HomeScreen(), const CartScreen(), const ProfileScreen()];

class MainWarpper extends StatefulWidget {
  const MainWarpper({super.key});

  @override
  State<MainWarpper> createState() => _MainWarpperState();
}

class _MainWarpperState extends State<MainWarpper> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.09,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //TODO : implement selectable color
              InkWellItem(
                iconData: Icons.home,
                label: 'Home',
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              const SizedBox(
                width: 5,
              ),
              InkWellItem(
                iconData: Icons.card_travel,
                label: 'Cart',
                isSelected: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
              const SizedBox(
                width: 5,
              ),
              InkWellItem(
                iconData: Icons.person_2,
                label: 'Profile',
                isSelected: selectedIndex == 2,
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
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
