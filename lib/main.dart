import 'package:flutter/material.dart';
// import 'package:news/helper/webview.dart';
import 'package:news/nav_bar.dart';
// import 'nav_bar.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: const Color.fromRGBO(0, 0, 0, 1),
        useMaterial3: false,
      ),

      home: const NavBarPage(),
    );
  }
}