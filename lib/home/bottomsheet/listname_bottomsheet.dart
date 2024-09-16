import 'package:flutter/material.dart';
import 'package:todolist/items/taskitem_listname.dart';


import '../../model/tasklist_collection.dart';

class ListNameBottomsheet extends StatelessWidget {
  ListNameBottomsheet({super.key});
  final List<TaskListCollection> data = [
    TaskListCollection(title: 'facebook', icon: Icons.facebook_outlined, color: Colors.blue, tasklists: []),
    TaskListCollection(title: 'tiktok', icon: Icons.tiktok, color: Colors.black, tasklists: []),
    TaskListCollection(title: 'telegram', icon: Icons.telegram, color: Colors.blue.shade400, tasklists: []),
    TaskListCollection(title: 'dien thoai', icon: Icons.phone_iphone, color: Colors.red, tasklists: []),
    TaskListCollection(title: 'camera', icon: Icons.camera_alt, color: Colors.grey, tasklists: []),
    TaskListCollection(title: 'Bong', tasklists: []),
    TaskListCollection(title: 'danh sach', tasklists: []),
  ];

  get item => null;

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
          body:  ListView.builder(
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
