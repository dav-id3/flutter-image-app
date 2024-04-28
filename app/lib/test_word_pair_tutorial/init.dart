import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
