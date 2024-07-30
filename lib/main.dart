import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/task_group_provider.dart';
import 'package:todolist/provider/taskprovider.dart';
import 'package:todolist/routes.dart';
import 'package:todolist/themes.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => TaskGroupProvider()),
      ],
      child: MaterialApp(
      theme: AppTheme.theme,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.home,
    ),
    );
  }
}
