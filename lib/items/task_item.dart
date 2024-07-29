import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task_model.dart';
import '../provider/taskprovider.dart';
import 'package:todolist/bottomsheet/detailstask_bottomsheet/detailstask_bottomsheet.dart';

class TaskItems extends StatefulWidget {
  final TaskModel task;

  const TaskItems({required this.task, super.key});

  @override
  State<TaskItems> createState() => _TaskItemsState();
}

class _TaskItemsState extends State<TaskItems> {
  bool isChecked = false;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

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
                  isChecked = !isChecked;
                });
              },
              child: isChecked
                  ? const Icon(
                Icons.radio_button_checked,
                size: 27,
                color: Colors.blueAccent,
              )
                  : const Icon(
                Icons.radio_button_unchecked,
                size: 27,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: _titleController,
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
              onChanged: (value) {
                Provider.of<TaskProvider>(context, listen: false).updateTask(
                  widget.task,
                  value,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

