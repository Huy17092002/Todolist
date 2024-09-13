import 'package:flutter/material.dart';
import 'package:todolist/model/tasklist.dart';

class TaskListCollection {
  final String title;
  final IconData icon;
  final Color color;
  final List<TaskList> tasklists;

  TaskListCollection({
    required this.title,
    this.icon = Icons.format_list_bulleted_rounded,
    this.color = Colors.blue,
    required this.tasklists,
  });
}