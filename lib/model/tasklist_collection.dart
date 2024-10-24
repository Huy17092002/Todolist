import 'package:flutter/material.dart';
import 'package:todolist/model/tasklist.dart';

class TaskListCollection {
  late final String title;
  final List<TaskList> tasklists;

  TaskListCollection({
    required this.title,
    required this.tasklists,
  });
}
