import 'package:flutter/material.dart';

class TaskGroupItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;

  const TaskGroupItem({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = index == 0 ? Colors.purple : Colors.blue;

    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.playlist_add_circle,
            size: 39,
            color: iconColor,
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
        const Divider(
          height: 0,
          thickness: 0.7,
          indent: 70,
        ),
        // const ItemAdd(),
        // const ItemCamera(),
      ],
    );
  }
}
