import 'package:flutter/material.dart';
import 'package:todolist/widget/class_widget.dart';
class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.25),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      height: MediaQuery.of(context).size.height - 260,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          index++;
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.playlist_add_circle, size: 38, color: Colors.blueAccent),
                title: const Text(
                  'view',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onTap: () {
                  print('view $index');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTaskScreen(),
                    ),
                  );
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 17,
                ),
              ),
              const Divider(
                height: 0,
                thickness: 0.5,
                indent: 70,
                endIndent: 0,
              ),
            ],
          );
        },
      ),
    );
  }
}