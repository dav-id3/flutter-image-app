import 'package:sqflite/sqflite.dart';
import "package:app/memo_app/model/note.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path/path.dart' as p;

part 'sqflite.g.dart';

@Riverpod(keepAlive: true)
SqfliteService sqfliteService(SqfliteServiceRef ref) {
  return SqfliteService.getInstance();
}

// When the database is first created, create a table to store breeds
// and a table to store dogs.
Future<void> _onCreate(Database db, int version) async {
  // Run the CREATE {breeds} TABLE statement on the database.
  await db.execute(
    'CREATE TABLE notes(id INTEGER PRIMARY KEY, content TEXT',
  );
}

class SqfliteService {
  SqfliteService._();

  Database? _database;

  Future<void> openDb() async {
    final databasesPath = await getDatabasesPath();
    const dataBaseName = "hogehoge.db";
    final path = p.join(databasesPath, dataBaseName);
    _database ??= await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<List<Note>> getAllNotes() async {
    if (_database == null) {
      await openDb();
    }
    List<Map<String, dynamic>> maps = await _database?.query('notes') ?? [];
    return List.generate(maps.length, (index) => Note.fromMap(maps[index]));
  }

  Future<Note?> getNoteById(int id) async {
    if (_database == null) {
      await openDb();
    }
    List<Map<String, dynamic>> maps =
        await _database?.query('notes', where: 'id = ?', whereArgs: [id]) ?? [];
    return Note.fromMap(maps.first);
  }

  Future<void> createNote() async {
    if (_database == null) {
      await openDb();
    }
    await _database?.insert('notes', {'content': ""});
  }

  Future<int?> updateNote(int id, String? content) async {
    if (_database == null) {
      await openDb();
    }
    Map<String, dynamic> updatedNote = {'content': content};
    updatedNote.removeWhere((_, value) => value == null);

    return await _database?.update(
      'notes',
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
        ?.delete('notes', where: "id = ?", whereArgs: [id.toString()]);
  }

  static SqfliteService getInstance() => SqfliteService._();
}
