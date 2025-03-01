import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';


class TaskViewModel extends ChangeNotifier {
  List<TaskList> taskLists = [];
  String repeatOption = 'Không';
  List<Task> allTasks = [];

  List<Task> searchTasks(String query) {
    if (query.isEmpty) {
      return allTasks;
    }

    return allTasks.where((task) {
      return task.title.toLowerCase().contains(query.toLowerCase()) ||
          task.description!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }


  void addTaskToTaskList(TaskList taskList, Task newTask) {
    taskList.tasks.add(newTask);
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

  void updateRepeatOption(Task task, String option) {
    task.repeatOption = option;
    notifyListeners();
  }

  void updatePriority(Task task) {}
  
}
