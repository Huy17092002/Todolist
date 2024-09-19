import 'package:flutter/material.dart';
import 'package:todolist/routes.dart';
import '../../../model/tasklist.dart';
import '../../component/items/task_group_item.dart';

class HomeList extends StatelessWidget {
  HomeList({super.key});

  final List<TaskList> data = [
    TaskList(title: 'Facebook', icon: Icons.facebook, color: Colors.blue, tasks: []),
    TaskList(title: 'TikTok',icon: Icons.tiktok, color: Colors.black, tasks: []),
    TaskList(title: 'Telegram',icon: Icons.telegram, color: Colors.blue.shade400, tasks: []),
    TaskList(title: 'Dien Thoai',icon: Icons.phone_iphone, color: Colors.red, tasks: []),
    TaskList(title: 'Camera',icon: Icons.camera_alt, color: Colors.grey, tasks: []),
    TaskList(title: 'Bong', tasks: []),
    TaskList(title: 'Danh Sach', color: Colors.yellowAccent, tasks: []),
    TaskList(title: 'boi', tasks: []),
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
