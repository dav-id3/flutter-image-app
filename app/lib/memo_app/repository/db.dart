import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import "package:app/memo_app/note_page/provider.dart";

class DataBaseConnection extends AsyncNotifier<List<Map>> {
  late String path;
  late Database database;
  List<Map> listMap = [];

  @override
  Future<List<Map>> build() async {
    // getDatabasesPath()：デフォルトのデータベース保存用フォルダのパスを取得
    var databasesPath = await getDatabasesPath();
    // 取得したパスから本アプリ用にて生成するDB名を指定
    path = '$databasesPath/db.db';
    // データベースを開く（pathに存在しなければ新規作成）
    database = await openDatabase(path, version: 1,
        // DBがpathに存在しなかった場合にonCreateが呼び出される
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE note (id MEDIUMINT NOT NULL AUTO_INCREMENT, content TEXT, PRIMARY KEY (id))');
      await db.execute('INSERT INTO note (content) VALUES ("test content")');
    });
    return [];
  }

  void dbGet() async {
    // SELECT
    listMap = await database.rawQuery('SELECT content FROM note');
    List<String> contentList = [];
    listMap.forEach((map) => contentList.add(map['content']));
    // 状態更新
    ref.read(noteContentsProvider.notifier).update(contentList);
  }

  void dbInsert(String content) async {
    final noteContent = Provider.autoDispose((ref) {
      ref.watch(noteContentsProvider);
    });
    // INSERT
    await database.insert(
      'note',
      {'content': content},
    );
    // SELECT
    listMap = await database.rawQuery('SELECT content FROM note');
    List<String> contentList = [];
    listMap.forEach((map) => contentList.add(map['content']));
    // 状態更新
    ref.read(noteContentsProvider.notifier).update(contentList);
  }

  void dbUpdate(String id, String name, String message) async {
    final noteContent = Provider.autoDispose((ref) {
      ref.watch(noteContentsProvider);
    });
    // idをキーとしてUPDATE
    await database.update('Test', {'name': name, 'message': message},
        where: 'id = ?', whereArgs: [id]);
    // SELECT
    listMap = await database.rawQuery('SELECT content FROM note');
    List<String> contentList = [];
    listMap.forEach((map) => contentList.add(map['content']));
    // 状態更新
    ref.read(noteContentsProvider.notifier).update(contentList);
  }

  void dbDelete(String id) async {
    final noteContent = Provider.autoDispose((ref) {
      ref.watch(noteContentsProvider);
    });
    // idをキーとしてDELETE
    await database.delete('Test', where: 'id = ?', whereArgs: [id]);
    // SELECT
    listMap = await database.rawQuery('SELECT content FROM note');
    List<String> contentList = [];
    listMap.forEach((map) => contentList.add(map['content']));
    // 状態更新
    ref.read(noteContentsProvider.notifier).update(contentList);
  }
}

final dataBaseConnectionProvider =
    AsyncNotifierProvider<DataBaseConnection, List<Map>>(() {
  return DataBaseConnection();
});
