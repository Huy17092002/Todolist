import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';


class TaskList {
  final String title;
  final IconData icon;
  final Color color;
  final List<Task> tasks;

  TaskList({
    required this.title,
    this.icon = Icons.format_list_bulleted_rounded,
    this.color = Colors.blueAccent,
    required this.tasks,
  });
}