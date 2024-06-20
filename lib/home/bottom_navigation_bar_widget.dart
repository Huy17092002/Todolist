import 'package:flutter/material.dart';
import 'package:todolist/task/newreminder_screen.dart';
import 'package:todolist/task/addlist_screen.dart';
import 'package:todolist/configs.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            icon: const Icon(
              Icons.add_circle,
              size: 30,
              color: textButtonColor,
            ),
            label: const Text(
              'Lời nhắc mới',
              style: TextStyle(
                fontSize: 17,
                color: textButtonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const NewReminder();
                },
              );
            },
          ),
          const SizedBox(width: 45),
          TextButton(
            child: const Text(
              'Thêm danh sách',
              style: TextStyle(
                fontSize: 17,
                color: textButtonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                    height: 780,
                    child: const AddList(),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
