import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'first_page.dart';
import 'dart:developer' as dev;
import 'style.dart';

class SecondPage extends StatelessWidget {
  String name = "Second Page";
  SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Second Page",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/Screenshot.png"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 30),
                ),
                ElevatedButton(
                  onPressed: () {
                    dev.log("HelloWorld");
                    Navigator.pop(context);
                  },
                  child: const Text('Go to First Page'),
                ),
              ],
            ),
          ),
        ),
      ),
      theme: myThemeColor,
    );
  }
}
