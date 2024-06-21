import 'package:flutter/material.dart';

//(1) リストに表示するデータクラス
class ListItem {
  //タイトル
  String title;

  //項目番号
  int number;

  ListItem(this.title, this.number);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("順序可変リスト")),
          body: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  //(2) 初期リストの定義
  var list = List<ListItem>.generate(50, (int i) => ListItem("項目$i", i));

  @override
  Widget build(BuildContext context) {
    //(3) 順序変更可能のListView
    return ReorderableListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) => makeItemCard(list[i], context),
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final ListItem item = list.removeAt(oldIndex);
          list.insert(newIndex, item);
        });
  }

  //リストビューに表示するCard作成
  Widget makeItemCard(ListItem item, BuildContext context) {
    //(4) 公式サンプルのカラーをそのまま持ってきています
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    //(5) Card作成
    return Card(
      key: Key(item.number.toString()),
      child: ListTile(
        leading: const Icon(Icons.wb_sunny),
        title: Text(item.title),
        tileColor: item.number.isOdd ? oddItemColor : evenItemColor,
      ),
    );
  }
}
