import 'package:flutter/material.dart';
import 'package:todolist/model/priority.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/model/tasklist_collection.dart';

class TaskListCollectionViewModel extends ChangeNotifier {
  TaskListCollection? taskListCollection;
  bool isLoading = false;
  String? error;

  TaskList get taskList => TaskList(title: '', tasks: []);

  // Hàm lấy danh sách TaskList
  Future<void> getTaskListCollection() async {
    isLoading = true; // Thông báo đang tải
    error = null;
    try {
      await Future.delayed(const Duration(seconds: 3));
      taskListCollection = TaskListCollection(
        title: 'Danh sách của tôi',
        tasklists: [
          TaskList(
            title: 'Facebook',
            icon: Icons.facebook,
            color: Colors.blue,
            tasks: [
              Task(
                id: 1,
                title: 'New Reminder',
                description: "Vùng",
                isCompleted: false,
                deadline: '10/09/2024 15:00',
                repeat: 'Daily',
                priority: Priority.medium,
              ),
              Task(
                id: 2,
                title: 'Cat',
                description: 'Mèo',
                isCompleted: false,
                deadline: '10/09/2024 09:00',
                repeat: 'Daily',
                priority: Priority.high,
              ),
              Task(
                id: 3,
                title: 'Birth',
                description: 'Chim',
                isCompleted: false,
                deadline: '10/09/2024 15:00',
                repeat: 'Daily',
                priority: Priority.low,
              ),
              Task(
                  id: 4,
                  title: 'egj',
                  isCompleted: true,
                  description: 'heperlink'),
            ],
          ),
          TaskList(
            title: 'TikTok',
            icon: Icons.tiktok,
            color: Colors.black,
            tasks: [
              Task(
                id: 1,
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
                id: 1,
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
                id: 1,
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
                id: 1,
                title: 'Đá bóng',
                description: 'Ronaldo',
                isCompleted: false,
                deadline: '17/09/2024',
                repeat: '',
                priority: Priority.high,
              ),
              Task(
                id: 1,
                title: 'Cá',
                description: 'Fish',
                isCompleted: true,
                deadline: '20/01/2024',
              ),
            ],
          ),
        ],
      );
     //Kiểm tra tasklist rỗng, ném ra lỗi
      if (taskListCollection?.tasklists.isEmpty == true) {
        throw ('Danh sách tasklists rỗng');
      }
    } catch (e) {
      // Có lỗi, thông báo lỗi chi tiết
      error = 'Không thể tải dữ liệu! Lỗi: ${e.toString()}';
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  void addTaskList(TaskList newTaskList) {
    taskListCollection?.tasklists.add(newTaskList);
    notifyListeners();
  }

  // Xóa TaskList
  void deleteTaskList(TaskList taskList) {
    taskListCollection?.tasklists.remove(taskList);
    notifyListeners();
  }

  // Cập nhật TaskList
  void updateTaskList(TaskList taskList) {
    int index = taskListCollection?.tasklists.indexOf(taskList) ?? -1;
    if (index != -1) {
      taskListCollection?.tasklists[index] = taskList;
    }
    notifyListeners();
  }

  List<Map<String, dynamic>> searchTasks(String query) {
    if (query.isEmpty) return [];

    final results = <Map<String, dynamic>>[];
    final queryLower = query.toLowerCase();

    for (var taskList in taskListCollection?.tasklists ?? []) {
      for (var task in taskList.tasks) {
        final titleLower = task.title.toLowerCase();
        if (titleLower.startsWith(queryLower)) {
          results.add({
            'task': task,
            'taskList': taskList.title,
          });
        }
      }
    }
    return results;
  }
}
