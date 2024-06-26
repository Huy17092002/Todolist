import 'package:flutter/material.dart';
import 'package:todolist/routes.dart';
import 'package:todolist/themes.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.home,
    );
  }
}
