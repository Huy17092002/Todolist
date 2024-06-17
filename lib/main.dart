import 'package:flutter/material.dart';
import 'package:todolist/home/home_page.dart';
import 'package:todolist/routes.dart';
import 'package:todolist/themes.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.lightTheme(),
      home: const HomePage(),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

