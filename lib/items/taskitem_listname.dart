import 'package:flutter/material.dart';
import 'package:todolist/model/tasklist_collection.dart';

class TaskItemListName extends StatelessWidget {
  final VoidCallback onTap;
  final TaskListCollection model;

  const TaskItemListName({
    super.key,
    required this.onTap,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: model.color,
            ),
            child: Icon(
              model.icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: Text(
            model.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          onTap: onTap,
          trailing: const Icon(
            Icons.check_rounded,
            color: Colors.blueAccent,
            size: 24,
            weight: 400,
          ),
        ),
        Divider(
          height: 1.0,
          color: Colors.grey[350],
          indent: 70,
        ),
      ],
    );
  }
}
