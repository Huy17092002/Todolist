// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todolist/view/component/items/task_list_item.dart';
// import 'package:todolist/view/home/homepage/home_bottom_navigationbar.dart';
// import 'package:todolist/view/home/homepage/home_searchbar.dart';
// import 'package:todolist/view/task/tasklist_page.dart';
// import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';
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
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 5, top: 15),
//               child: Text(
//                 Provider.of<TaskListCollectionViewModel>(context, listen: false).title,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   height: 1.5,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 5),
//             Consumer<TaskListCollectionViewModel>(
//               builder: (context, taskListCollectionViewModel, child) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white70),
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: taskListCollectionViewModel.taskLists.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final item = taskListCollectionViewModel.taskLists[index];
//                       return TaskListItem(
//                         onTap: () {
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
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const HomeBottomNavigationBar(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view/component/items/task_list_item.dart';
import 'package:todolist/view/home/homepage/home_bottom_navigationbar.dart';
import 'package:todolist/view/home/homepage/home_searchbar.dart';
import 'package:todolist/view/task/tasklist_page.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final taskListCollectionViewModel = Provider.of<TaskListCollectionViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 67,
        title: const HomeSearchBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 15),
              child: Text(
                taskListCollectionViewModel.taskListCollection.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70),
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: taskListCollectionViewModel.taskListCollection.tasklists.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = taskListCollectionViewModel.taskListCollection.tasklists[index];
                  return TaskListItem(
                    onTap: () {
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
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}