import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';
import '../../../model/priority.dart';
import '../../../model/task.dart';
import '../../../model/tasklist.dart';
import '../../../model/tasklist_collection.dart';
import '../../component/items/task_list_item.dart';
import '../../task/tasklist_page.dart';
import 'home_bottom_navigationbar.dart';
import 'home_searchbar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

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

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 67,
        title: const HomeSearchBar(),
      ),
      body: Consumer<TaskListCollectionViewModel>(
        builder: (BuildContext context, taskListViewModel,  child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5, top: 15),
                  child: Text(
                    'Danh sach cua toi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 0.24),
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: taskListViewModel.taskLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = taskListViewModel.taskLists[index];
                      return TaskListItem(
                        onTap: () {
                          print('${item.title} $index');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskListPage(taskList: item),
                            ),
                          );
                        },
                        model: item,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../viewmodel/tasklistcollection_viewmodel.dart';
// import '../../component/items/task_list_item.dart';
// import '../../task/tasklist_page.dart';
//
// import 'home_bottom_navigationbar.dart';
// import 'home_searchbar.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         toolbarHeight: 67,
//         title: const HomeSearchBar(),
//       ),
//       body: Consumer<TaskListViewModel>(
//         builder: (context, taskListViewModel, child) {
//           return SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(left: 5, top: 15),
//                   child: Text(
//                     'Danh sách của tôi',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       height: 1.5,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black26, width: 0.24),
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: taskListViewModel.taskLists.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final item = taskListViewModel.taskLists[index];
//                       return TaskListItem(
//                         onTap: () {
//                           print('${item.title} $index');
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => TaskListPage(taskList: item),
//                             ),
//                           );
//                         },
//                         model: item,
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: const HomeBottomNavigationBar(),
//     );
//   }
// }