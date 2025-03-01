import 'package:todolist/model/priority.dart';
import 'package:todolist/model/tasklist.dart';
import 'location.dart';

class Task {
  int id;
  String title;
  String? description;
  bool isCompleted;
  String? deadline;
  String repeat;
  Priority priority;
  Location? location;
  DateTime? reminderTime;
  String? repeatOption;

  Task({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    this.priority = Priority.none,
    this.location,
    this.deadline='',
    this.repeat = '',
    this.reminderTime,
    this.repeatOption,
  });

  String get priorityName {
    return priority.name;
  }

}