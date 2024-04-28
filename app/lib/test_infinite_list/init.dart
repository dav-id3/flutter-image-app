import 'package:app/test_infinite_list/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer' as dev;

part 'init.g.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Startup Name Generator'),
              ),
              body: GenerateRows(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  ref.read(myWordsListProvider.notifier).renewWords();
                },
                child: const Icon(
                  Icons.autorenew,
                  color: Colors.white,
                ),
              ),
            ),
            theme: myThemeColor,
          );
        },
      ),
    );
  }
}

@riverpod
class MyWordsList extends _$MyWordsList {
  @override
  List<String> build() => [];

  void addWords() {
    final wordPair = WordPair.random();
    state.add(wordPair.asCamelCase.toString());
  }

  void renewWords() {
    state.clear(); // ListViewのiも張り直さないとindex out of rangeでエラーになる
  }
}

class GenerateRows extends ConsumerWidget {
  const GenerateRows({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> myWordsList = ref.watch(myWordsListProvider);

    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= myWordsList.length) {
            for (int i = 0; i < 10; i++) {
              ref.read(myWordsListProvider.notifier).addWords();
            }
          }
          dev.log("debug: $myWordsList");
          dev.log("debug: $index, ${myWordsList[index]}");
          return _buildRow(myWordsList[index]);
        });
  }

  Widget _buildRow(String pair) {
    return ListTile(
      title: Text(
        pair,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
