import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/services/notification_service.dart';
import 'package:todolist/widget/repeatintervalltime_bottomsheet.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';
import 'package:todolist/widget/datetime_picker.dart';

class DetailsTaskBottomsheet extends StatefulWidget {
  final Task task;
  final TaskList taskList;
  final Function(DateTime?) onDateTimeChanged;
  const DetailsTaskBottomsheet({
    super.key,
    required this.task,
    required this.taskList,
    required this.onDateTimeChanged,
  });

  @override
  State<DetailsTaskBottomsheet> createState() => _DetailsTaskBottomsheetState();
}

class _DetailsTaskBottomsheetState extends State<DetailsTaskBottomsheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? reminderTime;


  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(text: widget.task.description);
    reminderTime = widget.task.reminderTime;
  }

  void initializeNotifications() async {
    await NotificationService.initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Container(
        color: Colors.grey,
        height: 700,
        width: 500,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 400,
            leading: Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 20)),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 100),
                TextButton(
                  child: const Text(
                    'Lưu',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                    widget.task.title = titleController.text;
                    widget.task.description = descriptionController.text;
                    widget.task.reminderTime = reminderTime;

                    widget.onDateTimeChanged(reminderTime);

                    Provider.of<TaskViewModel>(context, listen: false)
                        .updateTaskTitle(widget.taskList, widget.task, titleController.text);
                    Provider.of<TaskViewModel>(context, listen: false)
                        .updateTaskDescription(widget.taskList, widget.task, descriptionController.text);
                  },
                )
              ],
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              DateTimePicker(
                onDateTimeChanged: (newDateTime) {
                  setState(() {
                    reminderTime = newDateTime;
                  });
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return RepeatIntervallTime(
                        task: widget.task,
                        taskList: widget.taskList,
                      );
                    },
                  );
                },
                child: Container(
                  height: 55,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.repeat_on,
                          color: Colors.grey,
                          size: 42,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Lặp lại',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.task.repeatOption ?? 'Không',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 1),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}





