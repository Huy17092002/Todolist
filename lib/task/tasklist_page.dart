import 'package:flutter/material.dart';


class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => TaskListPageState();
}

class TaskListPageState extends State<TaskListPage> {
  final List<Widget> _reminderInputs = [];

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
                  items:
                  <PopupMenuItem>[
                    const PopupMenuItem(
                      value: Icons.preview,
                      child: ListTile(
                        leading: Text(
                          'Thông tin danh sách',
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Icon(Icons.info_outline),
                      ),
                    ),
                    const PopupMenuItem(
                      value: Icons.share,
                      child: ListTile(
                        leading: Text(
                          'Chọn lời nhắc',
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Icon(Icons.check_circle_outline),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Text(
                          'Sắp xếp theo',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        title: Icon(Icons.import_export),
                      ),
                    ),
                    const PopupMenuItem(
                        child: ListTile(
                          leading: Text(
                            'Lời nhắc đã hoàn tất',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Icon(Icons.remove_red_eye_outlined),
                        )),
                    const PopupMenuItem(
                        child: ListTile(
                          leading: Text(
                            'In',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Icon(Icons.print),
                        )),
                    const PopupMenuItem(
                        child: ListTile(
                          leading: Text(
                            'Xóa danh sách',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red
                            ),
                          ),
                          title: Icon(Icons.delete_rounded,color: Colors.red,),
                        )),
                  ],
                );
              },
            ),
            TextButton(
              child: const Text(
                'Xong',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Xong'),
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
            child: ListView(
              children: [
                ..._reminderInputs,
              ],
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
              setState(() {
                _reminderInputs.add(_buildReminderInput());
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildReminderInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 5),
      child: TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.radio_button_unchecked, color: Colors.grey),
            hintText: 'Add note',
            suffixIcon: Icon(Icons.info_outline)),
      ),
    );
  }
}




