import 'package:flutter/material.dart';
import 'package:todolist/model/priority.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';


class TaskListCollection {
  final String title;
  final Color color;
  final List<TaskList> tasklists;

  TaskListCollection({
    required this.title,
    this.color = Colors.black,
    required this.tasklists,
  });
}


