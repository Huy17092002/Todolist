import 'package:flutter/material.dart';
import 'package:todolist/items/task_group_item.dart';
import 'package:todolist/routes.dart';

class ListsWidget extends StatelessWidget {
  const ListsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                TaskGroupItem(
                  onTap: () {
                    print('view $index');
                    Navigator.pushNamed(context, Routes.addTask);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}




