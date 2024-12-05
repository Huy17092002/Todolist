import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/routes.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskListCollectionViewModel()),
        ChangeNotifierProvider(create:(_) => TaskViewModel()),
      ],
      child: const MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}
