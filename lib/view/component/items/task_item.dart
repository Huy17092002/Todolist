import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/task/bottomsheet/details_tasklistpage_bottomsheet.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final TaskList taskList;
  final Function(Task)? onTaskSelected;

  const TaskItem({super.key, required this.task, required this.taskList, this.onTaskSelected});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  late FocusNode _titleFocusNode;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(text: widget.task.description);
    _titleFocusNode = FocusNode();
    isChecked = widget.task.isCompleted;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.task.title.isEmpty) {
        FocusScope.of(context).requestFocus(_titleFocusNode);
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, taskViewModel, child) {
        _titleController.text = widget.task.title;
        _descriptionController.text = widget.task.description ?? '';

        String formattedReminderTime = '';
        if (widget.task.reminderTime != null) {
          formattedReminderTime =
              DateFormat('HH:mm, dd/MM/yyyy').format(widget.task.reminderTime!);
        }

        String repeatOption = widget.task.repeatOption ?? '';
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
                      return DetailsTaskListPageBottomsheet(
                        task: widget.task,
                        taskList: widget.taskList,
                      );
                    },
                  );
                },
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                label: 'Chi tiết',
              ),
              SlidableAction(
                onPressed: (context) {
                  taskViewModel.deleteTask(widget.taskList, widget.task);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                label: 'Xóa',
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
                        taskViewModel.toggleTaskCompletion(
                          widget.taskList,
                          widget.task,
                        );
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
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: TextField(
                              controller: _titleController,
                              focusNode: _titleFocusNode,
                              cursorHeight: 24,
                              onTap: () {
                                widget.onTaskSelected!(widget.task);
                              },
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
                                        return DetailsTaskListPageBottomsheet(
                                          task: widget.task,
                                          taskList: widget.taskList,
                                        );
                                      },
                                    );
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 1),
                                    child: Icon(Icons.info_outline),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: isChecked ? Colors.grey : Colors.black,
                              ),
                              onChanged: (value) {
                                taskViewModel.updateTaskTitle(
                                  widget.taskList,
                                  widget.task,
                                  value,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 33,
                        child: TextField(
                          controller: _descriptionController,
                          cursorHeight: 17,
                          onTap: () {
                            widget.onTaskSelected!(widget.task);
                          },
                          decoration: InputDecoration(
                            hintText: 'Ghi chú',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          style: TextStyle(
                            color: isChecked ? Colors.grey : Colors.black,
                          ),
                          onChanged: (value) {
                            taskViewModel.updateTaskDescription(
                              widget.taskList,
                              widget.task,
                              value,
                            );
                          },
                        ),
                      ),
                      if (widget.task.reminderTime != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Text(
                                formattedReminderTime,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              ),
                              if (repeatOption != 'Không')
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    repeatOption,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      const Divider(height: 0.3, color: Colors.grey),
                      const SizedBox(height: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

