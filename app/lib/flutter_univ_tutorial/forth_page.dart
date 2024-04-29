import 'package:flutter/material.dart';

class ForthPage extends StatelessWidget {
  List<String> titleList = <String>[
    'Title1',
    'Title2',
    'Title3',
    'Title4',
    'Title5'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forth Page",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Forth Page'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.ondemand_video_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                return;
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                return;
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Container(
          color: Colors.black,
          child: ListView.builder(
              itemCount: titleList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(width: 8), // Add this line
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titleList[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  maxLines: 3,
                                ),
                                const Text('uploaded at XX view XX',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                              ],
                            ),
                          ),
                        ]));
              }),
        ),
      ),
    );
  }
}
