import 'package:flutter/material.dart';
import 'package:todolist/model/priority.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/model/tasklist_collection.dart';

class TaskListCollectionViewModel extends ChangeNotifier {
  TaskListCollection? taskListCollection;
  bool isLoading = false;
  String? error;

  // Hàm lấy danh sách TaskList
  Future<void> getTaskListCollection() async {
    isLoading = true;// Thông báo đang tải
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
              Task(title: 'egj', isCompleted: true, description: 'heperlink'),
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
      // Kiểm tra tasklist rỗng, ném ra lỗi
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

  // Thêm TaskList
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
}


//
// import 'package:flutter/material.dart';
// import 'package:todolist/model/priority.dart';
// import 'package:todolist/model/task.dart';
// import 'package:todolist/model/tasklist.dart';
// import 'package:todolist/model/tasklist_collection.dart';
//
// class TaskListCollectionViewModel extends ChangeNotifier {
//   TaskListCollection? taskListCollection;
//   bool isLoading = false;
//   String? error;
//
//   Future<void> getTaskListCollection() async {
//     isLoading = true;
//     error = null;
//     try {
//       await Future.delayed(const Duration(seconds: 2));
//       taskListCollection = TaskListCollection(
//         title: 'Danh sách của tôi',
//         tasklists: []
//         // tasklists: [
//         //   TaskList(
//         //     title: 'Facebook',
//         //     icon: Icons.facebook,
//         //     color: Colors.blue,
//         //     tasks: [
//         //       Task(
//         //         title: 'New Reminder',
//         //         description: "Vùng",
//         //         isCompleted: false,
//         //         deadline: '10/09/2024 15:00',
//         //         repeat: 'Daily',
//         //         priority: Priority.medium,
//         //       ),
//         //       Task(
//         //         title: 'Cat',
//         //         description: 'Mèo',
//         //         isCompleted: false,
//         //         deadline: '10/09/2024 09:00',
//         //         repeat: 'Daily',
//         //         priority: Priority.high,
//         //       ),
//         //       Task(
//         //         title: 'Birth',
//         //         description: 'Chim',
//         //         isCompleted: false,
//         //         deadline: '10/09/2024 15:00',
//         //         repeat: 'Daily',
//         //         priority: Priority.low,
//         //       ),
//         //       Task(title: 'egj', isCompleted: true, description: 'heperlink'),
//         //     ],
//         //   ),
//         //   TaskList(
//         //     title: 'TikTok',
//         //     icon: Icons.tiktok,
//         //     color: Colors.black,
//         //     tasks: [
//         //       Task(
//         //         title: 'Gạo',
//         //         description: 'Bắc',
//         //         isCompleted: false,
//         //         deadline: '17/09/2024',
//         //         repeat: '',
//         //         priority: Priority.high,
//         //       ),
//         //     ],
//         //   ),
//         //   TaskList(
//         //     title: 'Telegram',
//         //     icon: Icons.telegram,
//         //     color: Colors.blue.shade400,
//         //     tasks: [
//         //       Task(
//         //         title: 'Trứng',
//         //         description: 'Egg',
//         //         isCompleted: true,
//         //         deadline: '20/01/2024',
//         //       ),
//         //     ],
//         //   ),
//         //   TaskList(
//         //     title: 'Điện Thoại',
//         //     icon: Icons.phone_iphone,
//         //     color: Colors.red,
//         //     tasks: [
//         //       Task(
//         //         title: 'New Reminder',
//         //         description: 'Party',
//         //         isCompleted: false,
//         //         deadline: '10/09/2024 15:00',
//         //         repeat: 'Daily',
//         //         priority: Priority.low,
//         //       ),
//         //     ],
//         //   ),
//         //   TaskList(
//         //     title: 'Camera',
//         //     icon: Icons.camera_alt,
//         //     color: Colors.grey,
//         //     tasks: [
//         //       Task(
//         //         title: 'Đá bóng',
//         //         description: 'Ronaldo',
//         //         isCompleted: false,
//         //         deadline: '17/09/2024',
//         //         repeat: '',
//         //         priority: Priority.high,
//         //       ),
//         //       Task(
//         //         title: 'Cá',
//         //         description: 'Fish',
//         //         isCompleted: true,
//         //         deadline: '20/01/2024',
//         //       ),
//         //     ],
//         //   ),
//         // ],
//       );
//       if(taskListCollection?.tasklists.isEmpty == true){
//         throw Exception('');
//       }
//     }catch(errol) {
//       error = 'lỗi không tải được dữ liệu!';
//     }
//     isLoading = false;
//     notifyListeners();
//   }
//
//   void addTaskList(TaskList newTaskList) {
//     taskListCollection?.tasklists.add(newTaskList);
//     notifyListeners();
//   }
//
//   void deleteTaskList(TaskList taskList) {
//     taskListCollection?.tasklists.remove(taskList);
//     notifyListeners();
//   }
//
//   void updateTaskList(TaskList taskList) {
//     int index = taskListCollection?.tasklists.indexOf(taskList) ?? -1;
//     if (index != -1) {
//       taskListCollection?.tasklists[index] = taskList;
//       notifyListeners();
//     }
//   }
// }


