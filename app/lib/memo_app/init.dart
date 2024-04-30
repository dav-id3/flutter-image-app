import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:app/memo_app/note_page/provider.dart";
import "package:app/memo_app/repository/db.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: NoteList());
  }
}

class NoteList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentList = ref.watch(noteContentsProvider);
    final dataBaseConnectionProviderNotifier =
        ref.watch(dataBaseConnectionProvider.notifier);

    return MaterialApp(
      title: "Easy Note",
      home: Scaffold(
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
          color: Colors.black,
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
                                  contentList[index],
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
