// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteImpl _$$NoteImplFromJson(Map<String, dynamic> json) => _$NoteImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      isCompleteInt: (json['is_complete'] as num).toInt(),
      dateModified: (json['date_modified'] as num).toInt(),
    );

Map<String, dynamic> _$$NoteImplToJson(_$NoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'is_complete': instance.isCompleteInt,
      'date_modified': instance.dateModified,
    };
