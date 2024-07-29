// import 'package:flutter/material.dart';
//
// import '../model/task_model.dart';
//
//
// class TaskProvider with ChangeNotifier {
//   final List<TaskModel> _tasks = [];
//
//   List<TaskModel> get tasks => _tasks;
//
//   void addTask(TaskModel task) {
//     _tasks.add(task);
//     notifyListeners();
//   }
//
// }



import 'package:flutter/cupertino.dart';

import '../model/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }


  void updateTask(TaskModel oldTask, String newTitle) {
    final task = _tasks.firstWhere((t) => t.id == oldTask.id);
    task.updateTitle(newTitle);
    notifyListeners();
  }
}

