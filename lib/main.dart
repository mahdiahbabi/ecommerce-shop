import 'package:ecommerce_shop/theme/theme.dart';
import 'package:ecommerce_shop/ui/home_screen/home.dart';
import 'package:flutter/material.dart';

void main() {
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
            textStyle: MaterialStatePropertyAll(TextStyle(color: Color.fromARGB(255, 143, 149, 158))),
            // backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 63, 125, 218))
          )
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: LightColor.titleTextColor,
            ),
            bodySmall: TextStyle(
              fontSize: 15,
              color: LightColor.captionTextColor,
            )),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, background: LightColor.backgroundColor, secondary: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
