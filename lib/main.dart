import 'package:ecommerce_shop/data/data_source/auth_data_source.dart';
import 'package:ecommerce_shop/data_base/data.dart';
import 'package:ecommerce_shop/data_base/productdata.dart';
import 'package:ecommerce_shop/mainwarpper.dart';
import 'package:ecommerce_shop/theme/theme.dart';
import 'package:ecommerce_shop/ui/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
 await Hive.initFlutter(); 
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(ProductDataAdapter());
await Hive.openBox<Data>('auth');
await Hive.openBox<ProductData>('product');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
              TextStyle(color: Color.fromARGB(255, 143, 149, 158))),
          // backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 63, 125, 218))
        )),
        textTheme:  const TextTheme(
            titleLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: LightColor.titleTextColor,
            ),
            bodyMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 29, 30, 32)),
            bodySmall: TextStyle(
              fontSize: 15,
              color: LightColor.captionTextColor,
            ),
            ),
            appBarTheme: const AppBarTheme(color:  Color.fromARGB(255, 247, 247, 247)),
        colorScheme: ColorScheme.fromSeed(
          
            seedColor: Colors.black,
            background: LightColor.backgroundColor,
            secondary: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MainWarpper()
      
      // MainWarpper(),
      //  AuthScreen()
      // MainWarpper(),
    );
  }
}
