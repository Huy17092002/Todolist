import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bottomsheet/addlist_bottomsheet.dart';
import 'package:todolist/model/task_model.dart';
import '../provider/taskprovider.dart';
import 'package:todolist/items/task_item.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => TaskListPageState();
}

class TaskListPageState extends State<TaskListPage> {
  final TextEditingController titleController = TextEditingController();

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
            const SizedBox(width: 220),
            IconButton(
              icon: const Icon(Icons.pending_outlined, color: Colors.blue),
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
                            return const AddListBottomsheet();
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
          ],
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          final tasks = taskProvider.tasks;
          return Column(
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
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskItems(task: task);
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 33, right: 210),
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text('Add Task'),
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(labelText: 'Title'),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          final title = titleController.text.trim();
                          if (title.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Vui lòng nhập nội dung'),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }
                          final task = TaskModel(title: title);
                          Provider.of<TaskProvider>(context, listen: false).addTask(task);
                          titleController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('Add Task'),
                      ),
                      TextButton(
                        onPressed: () {
                          titleController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
