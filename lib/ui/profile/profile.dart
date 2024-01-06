import 'dart:ffi';

import 'package:ecommerce_shop/data/auth.dart';
import 'package:ecommerce_shop/data/data_source/auth_data_source.dart';
import 'package:ecommerce_shop/data_base/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProfileScreen extends StatelessWidget {
  @override
  var authbox = Hive.box<Data>('auth');
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(500),
              ),
              height: 100,
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    'assets/profile.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Mahdi',
            style: theme.titleLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            color: Colors.black12,
            height: 1,
          ),
          InkWell(
            onTap: () {
              // ignore: void_checks
              return profileshoewDilog(context, authbox);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Log Out',
                    style: theme.bodyLarge!.copyWith(fontSize: 17),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 1,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.history),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Check Out History',
                    style: theme.bodyLarge!.copyWith(fontSize: 17),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 1,
          )
        ],
      )),
    );
  }
}

profileshoewDilog(BuildContext context , Box<Data> box) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('log out'),
        actions: [
          TextButton(onPressed: () async{
            await box.clear();
            Navigator.pop(context);
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('succfully log out')));
          }, child: const Text('Yes')),
          TextButton(onPressed: () {
              Navigator.pop(context);
          }, child: const Text('No')),
        ],
      );
    },
  );
}
