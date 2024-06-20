import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => AddTaskScreenState();
}

class AddTaskScreenState extends State<AddTaskScreen> {
  List<Widget> _reminderInputs = [];

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
                  items: <PopupMenuItem>[
                    const PopupMenuItem(
                      value: Icons.preview,
                      child: ListTile(
                        leading: Text(
                          'Show List Info',
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Icon(Icons.info_outline),
                      ),
                    ),
                    const PopupMenuItem(
                      value: Icons.share,
                      child: ListTile(
                        leading: Text(
                          'Select Reminders',
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Icon(Icons.check_circle_outline),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Text(
                          'Sort By',
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
                            'Show Completed',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Icon(Icons.remove_red_eye_outlined),
                        )),
                    const PopupMenuItem(
                        child: ListTile(
                          leading: Text(
                            'Print',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Icon(Icons.print),
                        )),
                    const PopupMenuItem(
                        child: ListTile(
                          leading: Text(
                            'Delete List',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Icon(Icons.delete_rounded),
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
                  color: textButtonColor,
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




