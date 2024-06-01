import 'package:sqflite/sqflite.dart';
import "package:app/memo_app/model/note.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path/path.dart' as p;

part 'sqflite.g.dart';

@Riverpod(keepAlive: true)
SqfliteService sqfliteService(SqfliteServiceRef ref) {
  return SqfliteService.getInstance();
}

class SqfliteService {
  SqfliteService._();

  Database? _database;

  Future<void> openDb() async {
    final databasesPath = await getDatabasesPath();
    const dataBaseName = "hogehoge.db";
    final path = p.join(databasesPath, dataBaseName);
    _database ??=
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NULL, content TEXT NULL, is_complete INTEGER, date_modified INTEGER)');
    });
  }

  Future<List<Note>> getAllNotes() async {
    if (_database == null) {
      await openDb();
    }
    List<Map<String, dynamic>> todos = await _database
            ?.rawQuery('SELECT * FROM todos ORDER BY date_modified DESC') ??
        [];
    return todos.map((e) => Note.fromJson(e)).toList();
  }

  Future<Note?> getNoteById(int id) async {
    if (_database == null) {
      await openDb();
    }
    List<Map<String, dynamic>> todos = await _database
            ?.rawQuery('SELECT * FROM todos WHERE id = ?', [id.toString()]) ??
        [];
    return todos.map((e) => Note.fromJson(e)).toList().firstOrNull;
  }

  Future<Note?> createNote() async {
    if (_database == null) {
      await openDb();
    }
    final id = await _database?.insert('todos', {
      'title': 'Hey',
      'content': '',
      'is_complete': 0,
      'date_modified': DateTime.now().toUtc().millisecondsSinceEpoch
    });
    if (id == null) return null;
    return await getNoteById(id);
  }

  Future<int?> updateNote(
      int id, String? title, String? content, bool? isComplete) async {
    if (_database == null) {
      await openDb();
    }
    Map<String, dynamic> updatedNote = {
      'title': title,
      'content': content,
      'is_fav': isComplete == true
          ? 1
          : isComplete == false
              ? 0
              : null,
      'date_modified': DateTime.now().toUtc().millisecondsSinceEpoch
    };
    updatedNote.removeWhere((_, value) => value == null);

    return await _database?.update(
      'todos',
      updatedNote,
      where: "id = ?",
      whereArgs: [id.toString()],
    );
  }

  Future<int?> deleteNote(int id) async {
    if (_database == null) {
      await openDb();
    }
    return await _database
        ?.delete('todos', where: "id = ?", whereArgs: [id.toString()]);
  }

  static SqfliteService getInstance() => SqfliteService._();
}
