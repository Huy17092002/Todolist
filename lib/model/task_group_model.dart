import 'package:flutter/material.dart';

class TaskGroupModel {
  final String id;
  final String title;
  final Color color;
  final List<String> tasks; 

  TaskGroupModel({
    required this.id,
    required this.title,
    required this.color,
    required this.tasks,
  });

  void updateTitle(String newTitle) {}
}
