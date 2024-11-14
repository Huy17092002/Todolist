import 'package:flutter/material.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/model/tasklist_collection.dart';

class TaskListCollectionViewModel extends ChangeNotifier {
  TaskListCollection? taskListCollection;
  bool isLoading = false;
  String? error;

  Future<void> getTaskListCollection() async {
    isLoading = true;
    error = null;
    try {
      await Future.delayed(const Duration(seconds: 2));
      taskListCollection = TaskListCollection(
        title: '',
        tasklists: [],
      );

      if (taskListCollection?.tasklists.isEmpty == true) {
        throw "Danh sách tasklist trống!";
      }
    } catch (e) {
      error = e.toString();
      print("Error: $error");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void addTaskList(TaskList newTaskList) {
    taskListCollection?.tasklists.add(newTaskList);
    notifyListeners();
  }

  void deleteTaskList(TaskList taskList) {
    taskListCollection?.tasklists.remove(taskList);
    notifyListeners();
  }

  void updateTaskList(TaskList taskList) {
    int index = taskListCollection?.tasklists.indexOf(taskList) ?? -1;
    if (index != -1) {
      taskListCollection?.tasklists[index] = taskList;
      notifyListeners();
    }
  }
}





