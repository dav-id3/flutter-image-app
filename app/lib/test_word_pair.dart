import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: Container(
          child: Center(
            child: Container(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text(
                    'Hello, world!',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'Hello, world!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
