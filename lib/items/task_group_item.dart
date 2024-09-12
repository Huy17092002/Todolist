
import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';

class TaskGroupItem extends StatelessWidget {
  final VoidCallback onTap;

  const TaskGroupItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.playlist_add_circle,
            size: 39,
            color: Colors.purple,
          ),
          title: const Text(
            'view',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          onTap: onTap,
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 17,
          ),
        ),
        dividerTaskGroupItem,
        ListTile(
          leading: const Icon(
            Icons.add_circle,
            size: 39,
            color: Colors.blue,
          ),
          title: const Text(
            'add',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          onTap: onTap,
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 17,
          ),
        ),
        dividerTaskGroupItem,
        ListTile(
          leading: const Icon(
            Icons.ac_unit_rounded,
            size: 39,
            color: Colors.green,
          ),
          title:  const Text(
            'cold',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          onTap: onTap,
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 17,
          ),
        ),
        dividerTaskGroupItem,
      ],
    );
  }
}



