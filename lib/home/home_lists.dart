import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/items/task_group_item.dart';
import 'package:todolist/routes.dart';
import '../provider/task_group_provider.dart';

class ListsWidget extends StatelessWidget {
  const ListsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskGroupProvider>(
      builder: (context, taskGroupProvider, child) {
        if (taskGroupProvider.tasks.isEmpty) {
          return const Center(
            child: Text(''),
          );
        }

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
              itemCount: taskGroupProvider.tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final taskGroup = taskGroupProvider.tasks[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: TaskGroupItem(
                    title: taskGroup.title,
                    color: taskGroup.color,
                    onTap: () {
                      print('view $index');
                      Navigator.pushNamed(context, Routes.addTask);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

