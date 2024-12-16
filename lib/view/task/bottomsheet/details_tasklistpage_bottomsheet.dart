import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/widget/datetime_picker.dart';
import 'package:todolist/widget/location_selector.dart';
import 'package:todolist/widget/priority_selector.dart';

import '../../../viewmodel/task_viewmodel.dart';

class DetailsTaskListPageBottomsheet extends StatefulWidget {
  final Task task;
  final TaskList taskList;

  const DetailsTaskListPageBottomsheet({
    super.key,
    required this.task,
    required this.taskList,
  });

  @override
  State<DetailsTaskListPageBottomsheet> createState() =>
      _DetailsTaskListPageBottomsheetState();
}

class _DetailsTaskListPageBottomsheetState extends State<DetailsTaskListPageBottomsheet> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController =
        TextEditingController(text: widget.task.description);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Container(
          color: Colors.grey,
          height: 780,
          width: 500,
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 400,
              leading: Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Hủy',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 100),
                  const Text(
                    'Chi Tiết',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 90),
                  TextButton(
                    child: const Text(
                      'Lưu',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // Cập nhật task
                      widget.task.title = titleController.text;
                      widget.task.description = descriptionController.text;

                      // Cập nhật vào ViewModel
                      Provider.of<TaskViewModel>(context, listen: false)
                          .updateTaskTitle(
                              widget.taskList, widget.task, titleController.text);
                      Provider.of<TaskViewModel>(context, listen: false)
                          .updateTaskDescription(widget.taskList, widget.task,
                              descriptionController.text);

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 112,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                  hintText: 'Tiêu đề',
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                controller: descriptionController,
                                decoration: const InputDecoration(
                                  hintText: 'Ghi chú',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const DateTimePicker(),
                      const SizedBox(height: 20),
                      const LocationEnable(),
                      const SizedBox(height: 20),
                      PrioritySelector(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


