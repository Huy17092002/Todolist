import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/component/items/task_list_item.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

class ListNameBottomsheet extends StatelessWidget {
  final dynamic onSelect;
  final TaskList taskList;

  const ListNameBottomsheet({super.key, required this.onSelect, required this.taskList});


  @override
  Widget build(BuildContext context) {
    final taskListCollectionViewModel = Provider.of<TaskListCollectionViewModel>(context);
    final List<TaskList> taskLists = taskListCollectionViewModel.taskListCollection?.tasklists ?? [];

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: SizedBox(
        height: 780,
        width: 500,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            leadingWidth: 400,
            leading: Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 10)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.blue),
                      Text(
                        'Danh sách mới',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                const Text(
                  'Danh sách',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: taskLists.length,
            itemBuilder: (BuildContext context, int index) {
              final TaskList taskList = taskLists[index];
              return TaskListItem(
                model: taskList,
                onTap: () {
                  onSelect(taskList);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
