import 'package:ecommerce_shop/ui/cart/cart.dart';
import 'package:ecommerce_shop/ui/home_screen/home.dart';
import 'package:ecommerce_shop/ui/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final myList = [HomeScreen(), CartScreen(), ProfileScreen()];
class MainWarpper extends StatefulWidget {
  @override
  State<MainWarpper> createState() => _MainWarpperState();
}

class _MainWarpperState extends State<MainWarpper> {
  
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: IconButton(
            onPressed: () {
              setState(() {
                 selectedIndex = 0;
              });
             
            },
            icon: const Icon(Icons.home),
          ),
        ),
        BottomNavigationBarItem(
            label: 'Cart',
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });

                  // Navigator.of(context).push(CupertinoPageRoute(
                  //   builder: (context) => CartScreen(),
                  // ));
                  // print('dark lord');
                },
                icon: const Icon(Icons.card_travel))),
        BottomNavigationBarItem(
            label: 'Profile',
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  
                },
                icon: const Icon(Icons.person_2)))
      ]),
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


Widget selectableIndex(int selectedIndex){
   switch (selectedIndex) {
     case 0:
       return myList[0];
       break;
     case 1: 
     return myList[1];
       break;
     case 2 : 
     return myList[2]; 
          break;  
     default: 
     return  myList[0];
   }
}
