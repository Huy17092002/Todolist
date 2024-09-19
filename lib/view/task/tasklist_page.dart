import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';

import '../../model/priority.dart';
import '../component/items/task_item.dart';
import '../home/bottomsheet/list_info_bottomsheet.dart';



class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => TaskListPageState();
}

class TaskListPageState extends State<TaskListPage> {
  final List<Task> _tasks = [
    Task(
      title:'Newreminder',
      description: 'vung',
      isCompleted: false,
      deadline: '10/09/2024'',15:00',
      repeat: 'Daily',
      priority: Priority.medium,
    ),
    Task(
      title: 'gao',
      description: 'bac',
      isCompleted: false,
      deadline: '17/09/2024',
      repeat: '',
      priority: Priority.high,
      location: null,


    ),
    Task(
      title: 'trung',
      description: 'egg' ,
      isCompleted: true,
      deadline: '20/01/2024',

    ),
    Task(
        title: 'ga',
        description: 'trong' ,
        isCompleted: true,
        deadline: '20/11/2024',
        priority: Priority.low
    ),

    Task(
      title:'NewReminDer',
      description: 'party',
      isCompleted: false,
      deadline: '10/09/2024'',15:00',
      repeat: 'Daily',
      priority: Priority.high,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    'Danh sách',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 155,
            ),
            IconButton(
              icon: const Icon(
                Icons.pending_outlined,
                color: Colors.blue,
              ),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(10, 99, 9, 0),
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      child: const ListTile(
                        leading: Icon(Icons.info_outline, size: 30),
                        title: Text(
                          'Thông tin danh sách',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const ListInfoBottomsheet();
                          },
                        );
                      },
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.check_circle_outline, size: 30),
                        title: Text(
                          'Chọn lời nhắc',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.import_export, size: 30),
                        title: Text(
                          'Sắp xếp theo',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.remove_red_eye_outlined, size: 30),
                        title: Text(
                          'Lời nhắc đã hoàn tất',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.print, size: 30),
                        title: Text(
                          'In',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.delete_rounded, color: Colors.red, size: 30),
                        title: Text(
                          'Xóa danh sách',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Xong'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Xong',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'View',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return TaskItem(
                  task: task,

                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 33,
          right: 210,
        ),
        child: SingleChildScrollView(
          child: TextButton.icon(
            icon: const Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.blue,
            ),
            label: const Text(
              'Lời nhắc mới',
              style: TextStyle(
                fontSize: 17,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}