import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/task/bottomsheet/details_tasklistpage_bottomsheet.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final TaskList taskList;

  const TaskItem({super.key, required this.task, required this.taskList});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
    isChecked = widget.task.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const DetailsTaskListPageBottomsheet();
                },
              );
            },
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            label: 'Details',
          ),
          SlidableAction(
            onPressed: (context) {
              Provider.of<TaskViewModel>(context, listen: false).deleteTask(widget.taskList, widget.task);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Delete',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                    Provider.of<TaskViewModel>(context, listen: false).toggleTaskCompletion(widget.taskList, widget.task);
                  });
                },
                child: Icon(
                  isChecked
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  size: 26,
                  color: isChecked ? Colors.blueAccent : Colors.grey[350],
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          widget.task.priorityName,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.red),
                        ),
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          cursorHeight: 24,
                          decoration: InputDecoration(
                            hintText: '',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return const DetailsTaskListPageBottomsheet();
                                  },
                                );
                              },
                              child: const Icon(Icons.info_outline),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: isChecked ? Colors.grey : Colors.black,
                          ),
                          onChanged: (value) {
                            // Update task title
                            Provider.of<TaskViewModel>(context, listen: false).updateTaskTitle(widget.taskList, widget.task, value);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 20,
                    child: TextField(
                      controller: _descriptionController,
                      cursorHeight: 17,
                      decoration: InputDecoration(
                        hintText: 'Ghi chú',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey[600]),
                      ),
                      style: TextStyle(
                        color: isChecked ? Colors.grey : Colors.black,
                      ),
                      onChanged: (value) {
                        // Update task description
                        Provider.of<TaskViewModel>(context, listen: false).updateTaskDescription(widget.taskList, widget.task, value);
                      },
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Divider(height: 0.3, color: Colors.grey),
                  const SizedBox(height: 7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
