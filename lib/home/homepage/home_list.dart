import 'package:flutter/material.dart';
import 'package:todolist/items/task_group_item.dart';

import 'package:todolist/routes.dart';


import '../../model/tasklist_collection.dart';

class HomeList extends StatelessWidget {
   HomeList({super.key});

  final List<TaskListCollection> data = [
    TaskListCollection(title: 'facebook', icon: Icons.facebook_outlined, color: Colors.blue, tasklists: []),
    TaskListCollection(title: 'tiktok', icon: Icons.tiktok, color: Colors.black, tasklists: []),
    TaskListCollection(title: 'telegram', icon: Icons.telegram, color: Colors.blue.shade400, tasklists: []),
    TaskListCollection(title: 'dien thoai', icon: Icons.phone_iphone, color: Colors.red, tasklists: []),
    TaskListCollection(title: 'camera', icon: Icons.camera_alt, color: Colors.grey, tasklists: []),
    TaskListCollection(title: 'BONG', tasklists: []),
    TaskListCollection(title: 'danh sach',color: Colors.yellowAccent, tasklists: []),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 0.24),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            final item = data[index];
            return TaskGroupItem(
              onTap: () {
                print('${item.title}  $index');
                Navigator.pushNamed(context, Routes.addTask);
              },
              model: item,
            );
          },
        ),
      ),
    );
  }
}