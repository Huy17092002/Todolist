import 'package:flutter/material.dart';
import '../../../model/tasklist.dart';
import '../../../model/tasklist_collection.dart';
import '../../../routes.dart';
import '../../component/items/task_group_item.dart';
import 'home_bottom_navigationbar.dart';
import 'home_searchbar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final TaskListCollection data = TaskListCollection(
    title: 'Danh sách của tôi',
    tasklists: [
      TaskList(title: 'Facebook', icon: Icons.facebook, color: Colors.blue, tasks: []),
      TaskList(title: 'TikTok',icon: Icons.tiktok, color: Colors.black, tasks: []),
      TaskList(title: 'Telegram',icon: Icons.telegram, color: Colors.blue.shade400, tasks: []),
      TaskList(title: 'Dien Thoai',icon: Icons.phone_iphone, color: Colors.red, tasks: []),
      TaskList(title: 'Camera',icon: Icons.camera_alt, color: Colors.grey, tasks: []),
      TaskList(title: 'Bong', tasks: []),
      TaskList(title: 'Danh Sach', color: Colors.yellowAccent, tasks: []),
      TaskList(title: 'Boi', tasks: []),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 15),
              child: Text(
                widget.data.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: widget.data.color,
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
                itemCount: widget.data.tasklists.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = widget.data.tasklists[index];
                  return TaskGroupItem(
                    onTap: () {
                      print('${item.title} $index');
                      Navigator.pushNamed(context, Routes.addTask);
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


