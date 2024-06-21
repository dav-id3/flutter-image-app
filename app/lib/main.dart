// import 'package:app/test_infinite_list/init.dart';
import 'package:flutter/material.dart';
import 'package:app/memo_app/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
