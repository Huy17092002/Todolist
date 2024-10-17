import 'package:flutter/material.dart';
import 'package:todolist/model/priority.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';


class TaskListCollection {
  late final String title;
  final Color color;
  late final List<TaskList> tasklists;

  TaskListCollection({
    required this.title,
    this.color = Colors.black,
    required this.tasklists,
  });

}

final TaskListCollection data = TaskListCollection(
  title: 'Danh sách của tôi',
  tasklists: [
    TaskList(
      title: 'Facebook',
      icon: Icons.facebook,
      color: Colors.blue,
      tasks: [
        Task(
          title: 'Newreminder',
          description: 'vung',
          isCompleted: false,
          deadline: '10/09/2024' ',15:00',
          repeat: 'Daily',
          priority: Priority.medium,
        ),
        Task(
          title: 'cat',
          description: 'meo',
          isCompleted: false,
          deadline: '10/09/2024' ',09:00',
          repeat: 'Daily',
          priority: Priority.high,
        ),
        Task(
          title: 'birth',
          description: 'chim',
          isCompleted: false,
          deadline: '10/09/2024' ',15:00',
          repeat: 'Daily',
          priority: Priority.low,
        ),
      ],
    ),
    TaskList(
      title: 'TikTok',
      icon: Icons.tiktok,
      color: Colors.black,
      tasks: [
        Task(
          title: 'gao',
          description: 'bac',
          isCompleted: false,
          deadline: '17/09/2024',
          repeat: '',
          priority: Priority.high,
          location: null,
        ),
      ],
    ),
    TaskList(
      title: 'Telegram',
      icon: Icons.telegram,
      color: Colors.blue.shade400,
      tasks: [
        Task(
          title: 'trung',
          description: 'egg',
          isCompleted: true,
          deadline: '20/01/2024',
        ),
      ],
    ),
    TaskList(
      title: 'Dien Thoai',
      icon: Icons.phone_iphone,
      color: Colors.red,
      tasks: [
        Task(
          title: 'NewReminDer',
          description: 'party',
          isCompleted: false,
          deadline: '10/09/2024' ',15:00',
          repeat: 'Daily',
          priority: Priority.low,
        ),
      ],
    ),
    TaskList(
      title: 'Camera',
      icon: Icons.camera_alt,
      color: Colors.grey,
      tasks: [
        Task(
          title: 'Da bong',
          description: 'Ronaldo',
          isCompleted: false,
          deadline: '17/09/2024',
          repeat: '',
          priority: Priority.high,
          location: null,
        ),
        Task(
          title: 'Ca',
          description: 'fish',
          isCompleted: true,
          deadline: '20/01/2024',
        ),
      ],
    ),

  ],
);


