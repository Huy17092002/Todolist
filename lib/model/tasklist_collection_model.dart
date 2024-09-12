import 'package:todolist/model/tasklist_model.dart';

class TasklistCollection {
  final String title;
  final List<TaskList> tasklists;

  TasklistCollection({
    required this.title,
    required this.tasklists,
  });

  factory TasklistCollection.fromMap(Map<String, dynamic> map) {
    return TasklistCollection(
      title: map['title'],
      tasklists: (map['tasklists'] as List<dynamic>).map((tasklistMap) => TaskList.fromMap(tasklistMap as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'tasklists': tasklists.map((tasklist) => tasklist.toMap()).toList(),
    };
  }
}


