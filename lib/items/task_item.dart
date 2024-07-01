import 'package:flutter/material.dart';
import 'package:todolist/bottomsheet/detailstask_bottomsheet.dart';

class TaskItems extends StatefulWidget {
  const TaskItems({super.key});

  @override
  State<TaskItems> createState() => _TaskItemsState();
}

class _TaskItemsState extends State<TaskItems> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isCheck = !isCheck;
                });
              },
              child: (() {
                if (isCheck) {
                  return const Icon(
                    Icons.radio_button_checked,
                    size: 27,
                    color: Colors.blueAccent,
                  );
                } else {
                  return const Icon(
                    Icons.radio_button_unchecked,
                    size: 27,
                    color: Colors.grey,
                  );
                }
              })(),

            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Add note',
                suffixIcon: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const DetailsTaskBottomsheet();
                      },
                    );
                  },
                  child: const Icon(Icons.info_outline),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
