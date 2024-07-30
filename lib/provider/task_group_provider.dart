import 'package:flutter/cupertino.dart';
import 'package:todolist/model/task_group_model.dart';
import '../model/task_model.dart';

class TaskGroupProvider with ChangeNotifier {
  final List<TaskGroupModel> _tasks = [];

  List<TaskGroupModel> get tasks => _tasks;

  void addTask(TaskGroupModel task) {
    _tasks.add(task);
    notifyListeners();
  }


  void updateTask(TaskModel oldTask, String newTitle) {
    final task = _tasks.firstWhere((t) => t.id == oldTask.id);
    task.updateTitle(newTitle);
    notifyListeners();
  }
}
