import 'package:flutter/material.dart';
import '../../../model/priority.dart';
import '../../../model/task.dart';
import '../../../model/tasklist.dart';
import '../../../model/tasklist_collection.dart';
import '../../component/items/task_group_item.dart';
import '../../task/tasklist_page.dart';
import 'home_bottom_navigationbar.dart';
import 'home_searchbar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final TaskListCollection data = TaskListCollection(
    title: 'Danh sách của tôi',
    tasklists: [
      TaskList(
        title: 'Facebook',
        icon: Icons.facebook,
        color: Colors.blue,
        tasks: [
          Task(
            title: 'Newreminder',
            description: 'vung',
            isCompleted: false,
            deadline: '10/09/2024'',15:00',
            repeat: 'Daily',
            priority: Priority.medium,
          ),
          Task(
            title: 'cat',
            description: 'meo',
            isCompleted: false,
            deadline: '10/09/2024'',09:00',
            repeat: 'Daily',
            priority: Priority.high,
          ),Task(
            title: 'birth',
            description: 'chim',
            isCompleted: false,
            deadline: '10/09/2024'',15:00',
            repeat: 'Daily',
            priority: Priority.low,
          ),
        ],
      ),
      TaskList(
        title: 'TikTok',
        icon: Icons.tiktok,
        color: Colors.black,
        tasks: [
          Task(
            title: 'gao',
            description: 'bac',
            isCompleted: false,
            deadline: '17/09/2024',
            repeat: '',
            priority: Priority.high,
            location: null,
          ),
        ],
      ),
      TaskList(
        title: 'Telegram',
        icon: Icons.telegram,
        color: Colors.blue.shade400,
        tasks: [
          Task(
            title: 'trung',
            description: 'egg',
            isCompleted: true,
            deadline: '20/01/2024',
          ),
          Task(
              title: 'ga',
              description: 'trong',
              isCompleted: true,
              deadline: '20/11/2024',
              priority: Priority.low),
        ],
      ),
      TaskList(
        title: 'Dien Thoai',
        icon: Icons.phone_iphone,
        color: Colors.red,
        tasks: [
          Task(
            title: 'NewReminDer',
            description: 'party',
            isCompleted: false,
            deadline: '10/09/2024' ',15:00',
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
          Task(
            title: 'Ca',
            description: 'fish',
            isCompleted: true,
            deadline: '20/01/2024',
          ),
        ],
      ),
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
                      // ignore: avoid_print
                      print('${item.title} $index');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskListPage(taskList: item),
                        ),
                      );
                    }, model: item,
                 
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
