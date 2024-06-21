import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:app/memo_app/repository/sqflite.dart";
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
              // TODO: Implement search. filter content with hooked?
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
      body: ListView.builder(
          itemCount: contentList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(contentList[index].id.toString() +
                    contentList[index].content),
                onTap: () {
                  debugPrint("tapped note ${contentList[index].id}");
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    final int? noteId = contentList[index].id;
                    if (noteId != null) {
                      ref.read(noteServiceProvider.notifier).delete(noteId);
                    }
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(noteServiceProvider.notifier).add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
