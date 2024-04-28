import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:english_words/english_words.dart';

part 'test_words_provider.g.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: Content());
  }
}

class Content extends ConsumerWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String words = ref.watch(myWordsProvider);

    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: ProviderScope(
              child: Text(words),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ref.read(myWordsProvider.notifier).changeWords();
            },
            child: const Icon(Icons.add),
          ),
        ),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.lightBlueAccent,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.lightBlueAccent,
          ),
        ));
  }
}

@riverpod
class MyWords extends _$MyWords {
  @override
  String build() => 'HelloWorld';

  void changeWords() {
    final wordPair = WordPair.random();
    state = wordPair.asCamelCase.toString();
  }
}
