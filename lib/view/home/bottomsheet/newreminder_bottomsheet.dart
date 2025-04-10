import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/priority.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/services/notification_service.dart';
import 'package:todolist/view/home/bottomsheet/listname_bottomsheet.dart';
import 'package:todolist/view/task/bottomsheet/detailstask_bottomsheet.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';
import 'package:intl/intl.dart';

class NewReminderBottomsheet extends StatefulWidget {
  const NewReminderBottomsheet({super.key});
  get taskList => TaskList(title: '', tasks: []);
  get task => Task(id: 0, title: '', isCompleted: true, );


  @override
  NewReminderBottomsheetState createState() => NewReminderBottomsheetState();
}

class NewReminderBottomsheetState extends State<NewReminderBottomsheet> {
  String selectedTaskListTitle = 'chọn danh sách';
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TaskList? selectedTaskList;
  DateTime? reminderTime;
  String? repeatOption = 'Không';
  Priority priority = Priority.none;

  void onSelectTaskTitle(TaskList selectedTaskList) {
    setState(() {
      this.selectedTaskList = selectedTaskList;
      selectedTaskListTitle = selectedTaskList.title;
    });
  }

  void addNewTask() async {
    Navigator.pop(context);
    if (titleController.text.isNotEmpty && selectedTaskList != null) {
      final newTask = Task(
        id: DateTime.now().millisecond,
        title: titleController.text,
        description: descriptionController.text,
        isCompleted: false,
        reminderTime: reminderTime,
        repeat: repeatOption ?? '',
        priority: priority,
      );

      Provider.of<TaskViewModel>(context, listen: false)
          .addTaskToTaskList(selectedTaskList!, newTask);

      if (newTask.reminderTime != null) {
        await NotificationService.setScheduleNotification(
          scheduleDateTime: newTask.reminderTime!,
          title: newTask.title,
          body: newTask.description ?? '',
          id: newTask.id,
          isPlaySound: true,
        );
      }
    }
  }

  void initializeNotifications() async {
    await NotificationService.initNotification();
  }

  @override
  void initState() {
    super.initState();
    reminderTime = widget.task.reminderTime;
  }

  String getFormattedReminderTime() {
    if (reminderTime != null) {
      return DateFormat('yyyy-MM-dd – HH:mm').format(reminderTime!);
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      print('ddsgesg');
    });
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: SizedBox(
        height: 700,
        width: 500,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 400,
            leading: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: TextButton(
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 67),
                const Text(
                  'Lời nhắc mới',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 70),
                TextButton(
                  onPressed: addNewTask,
                  child: const Text(
                    'Thêm',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      width: 350,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                                  hintText: 'Ghi chú',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DetailsTaskBottomsheet(
                            onDateTimeChanged: (newDateTime) {
                              setState(() {
                                reminderTime = newDateTime;
                              });
                            },
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
                            const Text(
                              'Chi tiết',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              getFormattedReminderTime(),
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
                  GestureDetector(
                    onTap: () {
                      showMenu<Priority>(
                        context: context,
                        position: const RelativeRect.fromLTRB( 800,400,0,0),
                        items: Priority.values.map((priorityValue) {
                          return PopupMenuItem<Priority>(
                            value: priorityValue,
                            child: Row(
                              children: [
                                Text(priorityValue.name),
                              ],
                            ),
                          );
                        }).toList(),
                        elevation: 8.0,
                      ).then((selectedPriority) {
                        if (selectedPriority != null) {
                          setState(() {
                            priority = selectedPriority;
                          });
                        }
                      });
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
                            const Text(
                              'Độ ưu tiên',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              priority.name,
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
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return ListNameBottomsheet(
                            onSelect: onSelectTaskTitle,
                            taskList: widget.taskList,
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2, left: 15),
                        child: Row(
                          children: [
                            const Text(
                              'Danh sách',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              selectedTaskListTitle,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}









