import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/component/items/task_item.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

class SearchTaskScreen extends StatefulWidget {
  const SearchTaskScreen({super.key, required this.taskList});
  final TaskList taskList;

  @override
  State<SearchTaskScreen> createState() => _SearchTaskScreenState();
}

class _SearchTaskScreenState extends State<SearchTaskScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isContainerVisible = false;
  String searchQuery = '';

  void _filterResults(String query) {
    setState(() {
      searchQuery = query;
      isContainerVisible = query.isNotEmpty;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    _filterResults('');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: _filterResults,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Nhập để tìm kiếm',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 16.0,
                                ),
                              ),
                            ),
                          ),
                          if (searchQuery.isNotEmpty)
                            GestureDetector(
                              onTap: _clearSearch,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.cancel,
                                    color: Colors.grey, size: 20),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Hủy',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (isContainerVisible)
              Expanded(
               child:  Consumer<TaskListCollectionViewModel>(
                  builder: (context, taskListCollectionViewModel, child) {
                    final filteredTasks = taskListCollectionViewModel.searchTasks(searchQuery);
                    return ListView.builder(
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final taskInfo = filteredTasks[index];
                        final task = taskInfo['task'];
                        final taskListTitle = taskInfo['taskList'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                taskListTitle,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                ),
                              ),
                            ),
                            TaskItem(task: task, taskList: widget.taskList),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//
// class _SearchTaskScreenState extends State<SearchTaskScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   bool isContainerVisible = false;
//   String searchQuery = '';
//
//   void _filterResults(String query) {
//     setState(() {
//       searchQuery = query;
//       isContainerVisible = query.isNotEmpty;
//     });
//   }
//
//   void _clearSearch() {
//     _searchController.clear();
//     _filterResults('');
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               controller: _searchController,
//                               onChanged: _filterResults,
//                               decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.search),
//                                 hintText: 'Nhập để tìm kiếm',
//                                 border: InputBorder.none,
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 12.0,
//                                   horizontal: 16.0,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           if (searchQuery.isNotEmpty)
//                             GestureDetector(
//                               onTap: _clearSearch,
//                               child: const Padding(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Icon(Icons.cancel,
//                                     color: Colors.grey, size: 20),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 GestureDetector(
//                   onTap: Navigator.of(context).pop,
//                   child: const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       'Hủy',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.blue,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             if (isContainerVisible)
//               Expanded(
//                 child: Consumer<TaskListCollectionViewModel>(
//                   builder: (context, taskListCollectionViewModel, child) {
//                     final filteredTasks = taskListCollectionViewModel.searchTasks(searchQuery);
//                     return ListView.builder(
//                       itemCount: filteredTasks.length,
//                       itemBuilder: (context, index) {
//                         final taskInfo = filteredTasks[index];
//                         final task = taskInfo['task'];
//                         final taskListTitle = taskInfo['taskList'];
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 8.0),
//                               child: Text(
//                                 taskListTitle,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ),
//                             TaskItem(task: task, taskList: widget.taskList),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
