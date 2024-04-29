import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'style.dart';

class ThirdPage extends StatelessWidget {
  final List<String> entries = <String>[
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I"
  ];
  ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Third Page",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Third Page'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back to First Page')),
              Expanded(
                child: ListView.builder(
                  // padding: const EdgeInsets.all(10.0),
                  itemCount: entries.length * 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 2 == 0) {
                      return ListTile(
                        title: Text("Entey ${entries[index ~/ 2]}"),
                      );
                    } else {
                      return const Divider();
                    }
                  },
                ),
              )
            ]),
          ),
        ),
      ),
      theme: myThemeColor,
    );
  }
}
