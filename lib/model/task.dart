import 'package:todolist/model/priority.dart';
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
  });

  String get priorityName {
    return priority.name;
  }
}



