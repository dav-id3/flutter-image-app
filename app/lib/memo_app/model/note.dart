import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  const Note._();

  factory Note({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'is_complete') required int isCompleteInt,
    @JsonKey(name: 'date_modified') required int dateModified,
  }) = _Note;

  factory Note.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$NoteFromJson(json);

  bool get isComplete => isCompleteInt == 1;
}
