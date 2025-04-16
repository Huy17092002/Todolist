import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/widget/repeatintervalltime_bottomsheet.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';
import 'package:todolist/widget/datetime_picker.dart';
import 'package:todolist/services/notification_service.dart';
import 'package:todolist/widget/priority_selector.dart';

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

class _DetailsTaskListPageBottomsheetState
    extends State<DetailsTaskListPageBottomsheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? reminderTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController =
        TextEditingController(text: widget.task.description);
    initializeNotifications();
  }

  void initializeNotifications() async {
    await NotificationService.initNotification();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TaskViewModel>(context).repeatOption;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ClipRRect(
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
                leading: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Huỷ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                centerTitle: true,
                title: const Center(
                  child: Text(
                    'Chi Tiết',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                actions: [
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
                      Provider.of<TaskViewModel>(context, listen: false)
                          .updateTaskTitle(widget.taskList, widget.task,
                          titleController.text);
                      Provider.of<TaskViewModel>(context, listen: false)
                          .updateTaskDescription(widget.taskList, widget.task,
                          descriptionController.text);

                      if (widget.task.reminderTime != null) {
                        await NotificationService.setScheduleNotification(
                          scheduleDateTime: widget.task.reminderTime!,
                          title: widget.task.title,
                          body: widget.task.description ?? '',
                          id: widget.task.id,
                          isPlaySound: true,
                        );
                      }
                    },
                  ),
                ],
              ),
                body: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Container(
                      width: 350,
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
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: descriptionController,
                              decoration: const InputDecoration(
                                hintText: 'Mô tả',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    PrioritySelector(
                      task: widget.task,
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
