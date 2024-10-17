import 'package:flutter/material.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/model/tasklist_collection.dart';

class TaskListCollectionViewModel extends ChangeNotifier {
  final TaskListCollection _taskListCollection;

  TaskListCollectionViewModel(this._taskListCollection);

  List<TaskList> get taskLists => _taskListCollection.tasklists;

  String get title => _taskListCollection.title;

  void updateTitle(String newTitle) {
    _taskListCollection.title = newTitle;
    notifyListeners();
  }

  void addTaskList(TaskList newTaskList) {
    _taskListCollection.tasklists.add(newTaskList);
    notifyListeners();
  }

  void deleteTaskList(TaskList taskList) {
    _taskListCollection.tasklists.remove(taskList);
    notifyListeners();
  }

  void updateTaskList(TaskList taskList, String newTitle, Color newColor) {
    taskList.title = newTitle;
    taskList.color = newColor;
    notifyListeners();
  }
}



