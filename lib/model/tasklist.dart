import 'package:todolist/model/task.dart';

class TaskList {
  final String title;
  final List<Task> tasks;

  TaskList({required this.title, required this.tasks});
}