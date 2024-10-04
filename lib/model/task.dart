import 'package:todolist/model/priority.dart';
import 'location.dart';

class Task {
  String title;
  String? description;
  bool isCompleted;
  String? deadline;
  String repeat;
  Priority priority;
  Location? location;

  Task({
    required this.title,
    this.description,
    required this.isCompleted,
    this.priority = Priority.none,
    this.location,
    this.deadline='',
    this.repeat = '',
  });

  String get priorityName {
    return priority.name;
  }

}



