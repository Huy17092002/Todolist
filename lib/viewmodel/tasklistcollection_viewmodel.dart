import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/tasklist.dart';



class TaskListCollectionViewModel with ChangeNotifier {
  final List<TaskList> _taskLists = [];

  List<TaskList> get taskLists => _taskLists;

  void addTaskList(TaskList taskList) {
    _taskLists.add(taskList);
    notifyListeners();
  }

  void deleteTaskList(TaskList taskList) {
    _taskLists.remove(taskList);
    notifyListeners();
  }

}


// final List<TaskListCollection> taskList = TaskListCollection(
//   title: 'Danh sách của tôi',
//   tasklists: [
//     TaskList(
//       title: 'Facebook',
//       icon: Icons.facebook,
//       color: Colors.blue,
//       tasks: [
//         Task(
//           title: 'Newreminder',
//           description: 'vung',
//           isCompleted: false,
//           deadline: '10/09/2024' ',15:00',
//           repeat: 'Daily',
//           priority: Priority.medium,
//         ),
//         Task(
//           title: 'cat',
//           description: 'meo',
//           isCompleted: false,
//           deadline: '10/09/2024' ',09:00',
//           repeat: 'Daily',
//           priority: Priority.high,
//         ),
//         Task(
//           title: 'birth',
//           description: 'chim',
//           isCompleted: false,
//           deadline: '10/09/2024' ',15:00',
//           repeat: 'Daily',
//           priority: Priority.low,
//         ),
//       ],
//     ),
//     TaskList(
//       title: 'TikTok',
//       icon: Icons.tiktok,
//       color: Colors.black,
//       tasks: [
//         Task(
//           title: 'gao',
//           description: 'bac',
//           isCompleted: false,
//           deadline: '17/09/2024',
//           repeat: '',
//           priority: Priority.high,
//           location: null,
//         ),
//       ],
//     ),
//     TaskList(
//       title: 'Telegram',
//       icon: Icons.telegram,
//       color: Colors.blue.shade400,
//       tasks: [
//         Task(
//           title: 'trung',
//           description: 'egg',
//           isCompleted: true,
//           deadline: '20/01/2024',
//         ),
//       ],
//     ),
//     TaskList(
//       title: 'Dien Thoai',
//       icon: Icons.phone_iphone,
//       color: Colors.red,
//       tasks: [
//         Task(
//           title: 'NewReminDer',
//           description: 'party',
//           isCompleted: false,
//           deadline: '10/09/2024' ',15:00',
//           repeat: 'Daily',
//           priority: Priority.low,
//         ),
//       ],
//     ),
//     TaskList(
//       title: 'Camera',
//       icon: Icons.camera_alt,
//       color: Colors.grey,
//       tasks: [
//         Task(
//           title: 'Da bong',
//           description: 'Ronaldo',
//           isCompleted: false,
//           deadline: '17/09/2024',
//           repeat: '',
//           priority: Priority.high,
//           location: null,
//         ),
//         Task(
//           title: 'Ca',
//           description: 'fish',
//           isCompleted: true,
//           deadline: '20/01/2024',
//         ),
//       ],
//     ),
//   ],
// );