import 'package:flutter/material.dart';
import '../bottomsheet/detailstask_bottomsheet.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => TaskListPageState();
}

class TaskListPageState extends State<TaskListPage> {
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
              width: 220,
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
                    const PopupMenuItem(
                      height: 40,
                      value: Icons.preview,
                      child: ListTile(
                        leading: Icon(Icons.info_outline, size: 24),
                        title: Text('Thông tin danh sách', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40, // Adjusted height here
                      value: Icons.share,
                      child: ListTile(
                        leading: Icon(Icons.check_circle_outline, size: 24),
                        title: Text('Chọn lời nhắc', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40,
                      value: Icons.sort_by_alpha,
                      child: ListTile(
                        leading: Icon(Icons.import_export, size: 24),
                        title: Text('Sắp xếp theo', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40,
                      value: Icons.remove_red_eye,
                      child: ListTile(
                        leading: Icon(Icons.remove_red_eye_outlined, size: 24),
                        title: Text('Lời nhắc đã hoàn tất', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40,
                      value: Icons.print,
                      child: ListTile(
                        leading: Icon(Icons.print, size: 24),
                        title: Text('In', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40,
                      value: Icons.delete,
                      child: ListTile(
                        leading: Icon(Icons.delete_rounded, color: Colors.red, size: 24),
                        title: Text('Xóa danh sách', style: TextStyle(fontSize: 16, color: Colors.red)),
                      ),
                    ),
                  ],
                );
              },
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
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
                      hintText: 'Add note',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return const DetailsTaskBottomsheet();
                            },
                          );
                        },
                        child: const Icon(Icons.info_outline),
                      ),
                    ),
                  ),
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
            onPressed: () {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}



