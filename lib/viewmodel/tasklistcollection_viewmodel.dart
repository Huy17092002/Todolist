import 'package:flutter/material.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/model/tasklist_collection.dart';

class TaskListCollectionViewModel extends ChangeNotifier {
  TaskListCollection taskListCollection;

  TaskListCollectionViewModel(this.taskListCollection);

  List<TaskList> get taskLists => taskListCollection.tasklists;

  String get title => taskListCollection.title;

  void updateTitle(String newTitle) {
    taskListCollection.title = newTitle;
    notifyListeners();
  }

  void addTaskList(TaskList newTaskList) {
    taskListCollection.tasklists.add(newTaskList);
    notifyListeners();
  }

  void deleteTaskList(TaskList taskList) {
    taskListCollection.tasklists.remove(taskList);
    notifyListeners();
  }

  void editTaskList(TaskList taskList, String newName, Color newColor) {
    taskList.name = newName;
    taskList.color = newColor;
    notifyListeners();
  }
}