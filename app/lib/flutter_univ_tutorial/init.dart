import 'package:flutter/material.dart';
import "first_page.dart";
import 'style.dart';
import 'dart:developer' as dev;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelloWorld',
      home: FirstPage(),
      theme: myThemeColor,
    );
  }
}
