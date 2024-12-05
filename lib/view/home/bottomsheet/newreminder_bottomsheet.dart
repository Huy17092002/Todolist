import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/home/bottomsheet/listname_bottomsheet.dart';
import 'package:todolist/view/task/bottomsheet/detailstask_bottomsheet.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';

class NewReminderBottomsheet extends StatelessWidget {
  const NewReminderBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<TaskViewModel>(context, listen: false);

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
            leadingWidth: 400,
            leading: Row(
              children: [
                TextButton(
                  child: const Text(
                    'Hủy',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 60),
                const Text(
                  'Lời nhắc mới',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 70),
                TextButton(
                  child: const Text(
                    'Thêm',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    // if (taskViewModel.taskLists.isEmpty) {
                    //   taskViewModel.taskLists.add(TaskList(title: 'New TaskList', tasks: []));
                    // }
                    // final taskList = taskViewModel.taskLists[0];
                    // final newTask = Task(title: '', isCompleted: false);
                    // taskViewModel.addTask(taskList, newTask);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Tiêu đề',
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Ghi chú',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Chi tiết Container
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const DetailsTaskBottomsheet();
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 2, left: 20),
                        child: Row(
                          children: [
                            Text(
                              'Chi tiết',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 238),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 19,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Danh sách Container
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return ListNameBottomsheet();
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 2, left: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.playlist_add_circle,
                              color: Colors.green,
                              size: 36,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Danh sách',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 121),
                            Text(
                              'View',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


