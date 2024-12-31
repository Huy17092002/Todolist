import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';

class TaskViewModel extends ChangeNotifier {
  List<TaskList> taskLists = [];

  void addTaskToTaskList(TaskList taskList, Task task) {
    taskList.tasks.add(task);
    notifyListeners();
  }

  void deleteTask(TaskList taskList, Task task) {
    taskList.tasks.remove(task);
    notifyListeners();
  }

  void toggleTaskCompletion(TaskList taskList, Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void updateTaskTitle(TaskList taskList, Task task, String newTitle) {
    task.title = newTitle;
    notifyListeners();
  }

  void updateTaskDescription(TaskList taskList, Task task, String newDescription) {
    task.description = newDescription;
    notifyListeners();
  }
}
