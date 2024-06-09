import "package:app/memo_app/model/note.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:app/memo_app/repository/sqflite.dart";
import 'package:path/path.dart' as p;

part 'note.g.dart';

@riverpod
class NoteService extends _$NoteService {
  @override
  List<Note> build() => [];

  SqfliteService get _sqfliteService => ref.watch(sqfliteServiceProvider);

  Future<void> fetchAll() async {
    final todos = await _sqfliteService.getAllNotes();
    // state = state.copyWith(todos: todos);
    state = todos;
  }

  Future<void> add() async {
    await _sqfliteService.createNote();
    await fetchAll();
  }

  Future<void> delete(int id) async {
    await _sqfliteService.deleteNote(id);
    await fetchAll();
  }

  Future<void> putNoteContent(int id, String content) async {
    await _sqfliteService.updateNote(id, content);
    await fetchAll();
  }
}
