// ignore_for_file: void_checks, use_build_context_synchronously
import 'package:ecommerce_shop/data_base/data.dart';
import 'package:ecommerce_shop/ui/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

var authbox = Hive.box<Data>('auth');
ValueNotifier<bool> islogin = ValueNotifier<bool>(false);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    authbox.values.isNotEmpty ? islogin.value = true : islogin.value = false;
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder<bool>(
        valueListenable: islogin,
        builder: (context, value, child) {
          final isloginuser = authbox.values.isNotEmpty;
          return Column(
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
                isloginuser ? 'Mahdi' : 'gust',
                style: theme.titleLarge!.copyWith(fontSize: 20),
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
                  setState(() {
                    return islogin.value
                        ? profileshoewDilog(context, authbox)
                        : Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => AuthScreen(),
                          ));
                  });
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
                        isloginuser ? 'Log Out' : 'sign in',
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
                        'Check History',
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
          );
        },
      )),
    );
  }
}

profileshoewDilog(BuildContext context, Box<Data> box) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('log out'),
        actions: [
          TextButton(
              onPressed: () async {
                
                await box.clear();
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('succfully log out')));
              },
              child: const Text('Yes')),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No')),
        ],
      );
    },
  );
}
