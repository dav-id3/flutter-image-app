import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:app/memo_app/repository/db.dart_d";
import 'package:app/memo_app/service/note.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sqflite Test',
      // theme: ThemeData(),
      home: const NotePage(),
    );
  }
}

class NotePage extends ConsumerWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentList = ref.watch(noteServiceProvider);
    ref.read(noteServiceProvider.notifier).fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Note'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
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
        child: ListView.builder(
            itemCount: contentList.length,
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
                                contentList[index].title,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(noteServiceProvider.notifier).add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
