import 'package:todolist/model/task_model.dart';

class TaskList {
  final String title;
  final List<TaskModel> tasks;

  TaskList({
    required this.title,
    required this.tasks,
  });

  TaskList copyWith({
    String? title,
    List<TaskModel>? tasks,
  }){
    return TaskList(
      title: title?? this.title,
      tasks: tasks?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tasks': tasks.map((task) => task.toMap()).toList(),
    };
  }

  factory TaskList.fromMap(Map<String, dynamic> map) {
    return TaskList(
      title: map['title'] ,
      tasks: (map['tasks'] as List<dynamic>).map((taskMap) => TaskModel.fromMap(taskMap as Map<String, dynamic>)).toList(),
    );
  }
}