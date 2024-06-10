import 'package:flutter/material.dart';
import 'package:todolist/widget/class_widget.dart';

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
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const Addtask();
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
                color: Colors.blue,
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
