import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SafeArea(child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/12,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(500),
            ),
            height: 100,
            width: 100,

          ),
        ),
        SizedBox(
          height: 10,
        ),
        const Text('Name'),
      ],
    )),
   );
  }
}