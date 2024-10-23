import 'package:flutter/material.dart';
import 'package:todolist/model/priority.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/model/tasklist_collection.dart';

class TaskListCollectionViewModel extends ChangeNotifier {
  TaskListCollection taskListCollection = TaskListCollection(
    title: 'Danh sách của tôi',
    tasklists: [
      TaskList(
        title: 'Facebook',
        icon: Icons.facebook,
        color: Colors.blue,
        tasks: [
          Task(
            title: 'New Reminder',
            description: "Vùng",
            isCompleted: false,
            deadline: '10/09/2024 15:00',
            repeat: 'Daily',
            priority: Priority.medium,
          ),
          Task(
            title: 'Cat',
            description: 'Mèo',
            isCompleted: false,
            deadline: '10/09/2024 09:00',
            repeat: 'Daily',
            priority: Priority.high,
          ),
          Task(
            title: 'Birth',
            description: 'Chim',
            isCompleted: false,
            deadline: '10/09/2024 15:00',
            repeat: 'Daily',
            priority: Priority.low,
          ),
          Task(title: 'egj', isCompleted: true,description: 'hsedjkfh')
        ],
      ),
      TaskList(
        title: 'TikTok',
        icon: Icons.tiktok,
        color: Colors.black,
        tasks: [
          Task(
            title: 'Gạo',
            description: 'Bắc',
            isCompleted: false,
            deadline: '17/09/2024',
            repeat: '',
            priority: Priority.high,
          ),
        ],
      ),
      TaskList(
        title: 'Telegram',
        icon: Icons.telegram,
        color: Colors.blue.shade400,
        tasks: [
          Task(
            title: 'Trứng',
            description: 'Egg',
            isCompleted: true,
            deadline: '20/01/2024',
          ),
        ],
      ),
      TaskList(
        title: 'Điện Thoại',
        icon: Icons.phone_iphone,
        color: Colors.red,
        tasks: [
          Task(
            title: 'New Reminder',
            description: 'Party',
            isCompleted: false,
            deadline: '10/09/2024 15:00',
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
            title: 'Đá bóng',
            description: 'Ronaldo',
            isCompleted: false,
            deadline: '17/09/2024',
            repeat: '',
            priority: Priority.high,
          ),
          Task(
            title: 'Cá',
            description: 'Fish',
            isCompleted: true,
            deadline: '20/01/2024',
          ),
        ],
      ),
    ],
  );

  void addTaskList(TaskList newTaskList) {
    taskListCollection.tasklists.add(newTaskList);
    notifyListeners();
  }

  void deleteTaskList(TaskList taskList) {
    taskListCollection.tasklists.remove(taskList);
    notifyListeners();
  }

  void editTaskList(TaskList taskList, String newTitle, Color newColor) {
    taskList.title = newTitle;
    taskList.color = newColor;
    notifyListeners();
  }
}

