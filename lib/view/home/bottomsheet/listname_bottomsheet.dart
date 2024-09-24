import 'package:flutter/material.dart';

import '../../../model/priority.dart';
import '../../../model/task.dart';
import '../../../model/tasklist.dart';
import '../../component/items/taskitem_listname.dart';


class ListNameBottomsheet extends StatelessWidget {
  ListNameBottomsheet({super.key});
  final List<TaskList> data = [
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
              return TaskItemListName(
                onTap: () {

                  print('${item.title}  $index');
                  Navigator.pop(context);
                },
                model: item,
              );
            },
          ),

        ),
      ),
    );
  }
}
