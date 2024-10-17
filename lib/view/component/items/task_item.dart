import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/view/task/bottomsheet/custom_task_bottomsheet.dart';




class TaskItem extends StatefulWidget {
  final Task task;

  const TaskItem({
    super.key,
    required this.task,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(text: widget.task.description);
    isChecked = widget.task.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,top:0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Icon(
                isChecked ? Icons.radio_button_checked : Icons.radio_button_unchecked,
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
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.red),
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
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                  child: TextField(
                    controller: _descriptionController,
                    cursorHeight: 17,
                    decoration: InputDecoration(
                      hintText: 'Add note',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[600]),
                    ),
                    style: TextStyle(
                      color: isChecked ? Colors.grey : Colors.grey,
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: 21,
                  child: Text(
                    '${widget.task.deadline}, ${widget.task.repeat}',
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 180,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[600],
                              ),
                              child: const Icon(
                                Icons.directions_car,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          const Text(
                           'Getting out of the Car',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Divider(height: 0.3, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
