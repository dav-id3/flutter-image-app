import 'package:app/flutter_univ_tutorial/forth_page.dart';
import 'package:app/flutter_univ_tutorial/third_page.dart';
import 'package:flutter/material.dart';
import 'second_page.dart';
import 'dart:developer' as dev;

class FirstPage extends StatelessWidget {
  String name = "";
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter string shown on second page',
                    ),
                    onChanged: (text) {
                      dev.log(text);
                      name = text;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(name: name),
                        ),
                      );
                    },
                    child: const Text('Go to Second Page'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdPage(),
                        ),
                      );
                    },
                    child: const Text('Go to third Page'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForthPage(),
                        ),
                      );
                    },
                    child: const Text('Go to forth Page'),
                  ),
                ],
              ))),
    );
  }
}
