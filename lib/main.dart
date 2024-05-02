import 'package:flutter/material.dart';
import 'package:simpletodo/view/screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blueGrey[50]
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black, brightness: Brightness.dark),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[50]
      ),
      themeMode: ThemeMode.system,
      home: const Screen(),
    );
  }
}

