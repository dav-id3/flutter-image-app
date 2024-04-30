import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:developer' as dev;

part 'provider.g.dart';

@riverpod
class NoteContents extends _$NoteContents {
  @override
  List<String> build() => [];

  void update(List<String> newContents) {
    state = newContents;
  }
}
