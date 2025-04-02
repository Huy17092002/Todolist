import 'package:todolist/model/priority.dart';

class Task {
  int id;
  String title;
  String? description;
  bool isCompleted;
  String? deadline;
  String repeat;
  Priority priority;
  DateTime? reminderTime;
  String? repeatOption;

  Task({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    this.priority = Priority.none,
    this.deadline='',
    this.repeat = '',
    this.reminderTime,
    this.repeatOption,
  });

  String get priorityName {
    return priority.name;
  }

}