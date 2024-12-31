import 'package:flutter/material.dart';
import 'package:todolist/model/priority.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';

class ListNameBottomsheet extends StatelessWidget {
  final TaskList taskList;
  final Function(TaskList) onSelect;

  ListNameBottomsheet({super.key, required this.onSelect, required this.taskList});

  final List<TaskList> data = [
    TaskList(
      title: 'Dien Thoai',
      icon: Icons.phone_iphone,
      color: Colors.red,
      tasks: [
        Task(
          title: 'NewReminder',
          description: 'party',
          isCompleted: false,
          deadline: '10/09/2024, 15:00',
          repeat: 'Daily',
          priority: Priority.high,
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
      ],
    ),
    // Add more task lists here
  ];

  @override
  Widget build(BuildContext context) {
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
            leading: Column(
              children: [
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10, top: 50)),
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
                          SizedBox(
                            width: 20,
                          ),
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
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    'Reminder will be created in "View"',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final item = data[index];
              return ListTile(
                onTap: () {
                  onSelect(item);  // Gọi callback khi chọn TaskList
                },
                title: Text(item.title),
                leading: Icon(item.icon, color: item.color),
              );
            },
          ),
        ),
      ),
    );
  }
}