import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/tasklist_collection.dart';
import 'package:todolist/routes.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskListCollectionViewModel(data),
      child: const MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}