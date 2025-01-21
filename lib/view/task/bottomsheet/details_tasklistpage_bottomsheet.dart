// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:provider/provider.dart';
// import 'package:todolist/model/task.dart';
// import 'package:todolist/model/tasklist.dart';
// import 'package:todolist/view/component/bottomsheet/repeatintervalltime_bottomsheet.dart';
// import 'package:todolist/viewmodel/task_viewmodel.dart';
// import 'package:todolist/widget/datetime_picker.dart';
// import 'package:todolist/services/notification_service.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:todolist/widget/location_selector.dart';
// import 'package:todolist/widget/priority_selector.dart';
//
// class DetailsTaskListPageBottomsheet extends StatefulWidget {
//   final Task task;
//   final TaskList taskList;
//
//   const DetailsTaskListPageBottomsheet({
//     super.key,
//     required this.task,
//     required this.taskList,
//   });
//
//   @override
//   State<DetailsTaskListPageBottomsheet> createState() =>
//       _DetailsTaskListPageBottomsheetState();
// }
//
// class _DetailsTaskListPageBottomsheetState
//     extends State<DetailsTaskListPageBottomsheet> {
//   late TextEditingController titleController;
//   late TextEditingController descriptionController;
//   DateTime? reminderTime;
//
//   @override
//   void initState() {
//     super.initState();
//     titleController = TextEditingController(text: widget.task.title);
//     descriptionController =
//         TextEditingController(text: widget.task.description);
//
//     initializeNotifications();
//   }
//
//   void initializeNotifications() async {
//     await NotificationService.initNotification();
//   }
//
//   Future<void> scheduleNotification(DateTime scheduledDate) async {
//     tz.TZDateTime scheduledTime = tz.TZDateTime.from(scheduledDate, tz.local);
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       channelDescription: 'your_channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     await NotificationService.flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Nhắc nhở',
//       'Đến lúc thực hiện nhiệm vụ!',
//       scheduledTime,
//       platformChannelSpecifics,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.wallClockTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//       androidScheduleMode: AndroidScheduleMode.alarmClock,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//         child: Container(
//           color: Colors.grey,
//           height: 780,
//           width: 500,
//           child: Scaffold(
//             appBar: AppBar(
//               leadingWidth: 400,
//               leading: Row(
//                 children: [
//                   const Padding(padding: EdgeInsets.only(left: 20)),
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: const Row(
//                       children: [
//                         Text(
//                           'Hủy',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.blue,
//                               fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 100),
//                   const Text(
//                     'Chi Tiết',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(width: 100),
//                   TextButton(
//                     child: const Text(
//                       'Lưu',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     onPressed: () async {
//                       // Update task properties
//                       widget.task.title = titleController.text;
//                       widget.task.description = descriptionController.text;
//                       widget.task.reminderTime = reminderTime;
//
//                       // Update the task in the view model
//                       Provider.of<TaskViewModel>(context, listen: false)
//                           .updateTaskTitle(widget.taskList, widget.task, titleController.text);
//                       Provider.of<TaskViewModel>(context, listen: false)
//                           .updateTaskDescription(widget.taskList, widget.task, descriptionController.text);
//
//                       // Schedule notifications for all tasks
//                       for (var task in widget.taskList.tasks) {
//                         await scheduleNotificationForTask(task); // Schedule for each task
//                       }
//
//                       Navigator.pop(context);
//                     },
//                   ),
//
//                   // TextButton(
//                   //   child: const Text(
//                   //     'Lưu',
//                   //     style: TextStyle(
//                   //         fontSize: 18,
//                   //         color: Colors.blue,
//                   //         fontWeight: FontWeight.bold,
//                   //     ),
//                   //   ),
//                   //   onPressed: () {
//                   //     widget.task.title = titleController.text;
//                   //     widget.task.description = descriptionController.text;
//                   //     widget.task.reminderTime = reminderTime;
//                   //
//                   //     Provider.of<TaskViewModel>(context, listen: false)
//                   //         .updateTaskTitle(widget.taskList, widget.task,
//                   //             titleController.text);
//                   //     Provider.of<TaskViewModel>(context, listen: false)
//                   //         .updateTaskDescription(widget.taskList, widget.task,
//                   //             descriptionController.text);
//                   //
//                   //     if (reminderTime != null) {
//                   //       scheduleNotification(reminderTime!);
//                   //     }
//                   //
//                   //     Navigator.pop(context);
//                   //   },
//                   // ),
//                 ],
//               ),
//             ),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 21),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 350,
//                         height: 112,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey[300],
//                         ),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextField(
//                                 controller: titleController,
//                                 decoration: const InputDecoration(
//                                     hintText: 'Tiêu đề',
//                                     border: UnderlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: TextField(
//                                 controller: descriptionController,
//                                 decoration: const InputDecoration(
//                                     hintText: 'Mô tả',
//                                     border: InputBorder.none),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       DateTimePicker(
//                         onDateTimeChanged: (newDateTime) {
//                           setState(() {
//                             reminderTime = newDateTime;
//                           });
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (BuildContext context) {
//                               return const RepeatIntervallTime();
//                             },
//                           );
//                         },
//                         child: Container(
//                           height: 55,
//                           width: 350,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.grey[300],
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.only(top: 0, left: 15),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.repeat_on,
//                                   color: Colors.grey,
//                                   size: 42,
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text(
//                                   'Lặp lại',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 SizedBox(width: 160),
//                                 Text(
//                                   'Không',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 SizedBox(width: 1),
//                                 Icon(
//                                   Icons.arrow_forward_ios,
//                                   color: Colors.grey,
//                                   size: 16,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const LocationEnable(),
//                       const SizedBox(height: 20),
//                       PrioritySelector(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/component/bottomsheet/repeatintervalltime_bottomsheet.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';
import 'package:todolist/widget/datetime_picker.dart';
import 'package:todolist/services/notification_service.dart';
import 'package:todolist/widget/location_selector.dart';
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
  late TextEditingController titleController;
  late TextEditingController descriptionController;
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
                  // TextButton(
                  //   child: const Text(
                  //     'Lưu',
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       color: Colors.blue,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   onPressed: () async {
                  //     widget.task.title = titleController.text;
                  //     widget.task.description = descriptionController.text;
                  //     widget.task.reminderTime = reminderTime;
                  //
                  //     Provider.of<TaskViewModel>(context, listen: false)
                  //         .updateTaskTitle(widget.taskList, widget.task, titleController.text);
                  //     Provider.of<TaskViewModel>(context, listen: false)
                  //         .updateTaskDescription(widget.taskList, widget.task, descriptionController.text);
                  //
                  //     for (var task in widget.taskList.tasks) {
                  //       await NotificationService.scheduleNotificationForTask(task, widget.taskList);
                  //     }
                  //     Navigator.pop(context);
                  //   },
                  // ),
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
                      widget.task.title = titleController.text;
                      widget.task.description = descriptionController.text;
                      widget.task.reminderTime = reminderTime;

                      // Cập nhật Task trong TaskList
                      Provider.of<TaskViewModel>(context, listen: false)
                          .updateTaskTitle(widget.taskList, widget.task, titleController.text);
                      Provider.of<TaskViewModel>(context, listen: false)
                          .updateTaskDescription(widget.taskList, widget.task, descriptionController.text);

                      // Lập lịch thông báo cho tất cả các task trong taskList
                      for (var task in widget.taskList.tasks) {
                        await NotificationService.scheduleNotificationForTask(task, widget.taskList);
                      }

                      Navigator.pop(context);
                    },
                  )

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
                        },//
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return const RepeatIntervallTime();
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
                          child: const Padding(
                            padding: EdgeInsets.only(top: 0, left: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.repeat_on,
                                  color: Colors.grey,
                                  size: 42,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Lặp lại',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 150),
                                Text(
                                  'Không',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 1),
                                Icon(
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



// class _DetailsTaskListPageBottomsheetState
//     extends State<DetailsTaskListPageBottomsheet> {
//   late TextEditingController titleController;
//   late TextEditingController descriptionController;
//   DateTime? reminderTime;
//
//   @override
//   void initState() {
//     super.initState();
//     titleController = TextEditingController(text: widget.task.title);
//     descriptionController =
//         TextEditingController(text: widget.task.description);
//
//     initializeNotifications();
//   }
//
//   void initializeNotifications() async {
//     await NotificationService.initNotification();
//   }
//
//   Future<void> scheduleNotificationForTask(Task task) async {
//     if (task.reminderTime != null) {
//       tz.TZDateTime scheduledTime = tz.TZDateTime.from(task.reminderTime!, tz.local);
//
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//         'your_channel_id',
//         'your_channel_name',
//         channelDescription: 'your_channel_description',
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: 'ticker',
//       );
//       const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//
//       int notificationId = task.hashCode;
//
//       await NotificationService.flutterLocalNotificationsPlugin.zonedSchedule(
//         notificationId,
//         task.title,
//         task.description,
//         scheduledTime,
//         platformChannelSpecifics,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.wallClockTime,
//         matchDateTimeComponents: DateTimeComponents.time,
//         androidScheduleMode: AndroidScheduleMode.alarmClock,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//         child: Container(
//           color: Colors.grey,
//           height: 780,
//           width: 500,
//           child: Scaffold(
//             appBar: AppBar(
//               leadingWidth: 400,
//               leading: Row(
//                 children: [
//                   const Padding(padding: EdgeInsets.only(left: 20)),
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: const Row(
//                       children: [
//                         Text(
//                           'Hủy',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.blue,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 100),
//                   const Text(
//                     'Chi Tiết',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(width: 100),
//                   TextButton(
//                     child: const Text(
//                       'Lưu',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     onPressed: () async {
//                       widget.task.title = titleController.text;
//                       widget.task.description = descriptionController.text;
//                       widget.task.reminderTime = reminderTime;
//
//                       Provider.of<TaskViewModel>(context, listen: false)
//                           .updateTaskTitle(widget.taskList, widget.task, titleController.text);
//                       Provider.of<TaskViewModel>(context, listen: false)
//                           .updateTaskDescription(widget.taskList, widget.task, descriptionController.text);
//
//                       for (var task in widget.taskList.tasks) {
//                         await scheduleNotificationForTask(task);
//                       }
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 21),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 350,
//                         height: 112,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey[300],
//                         ),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextField(
//                                 controller: titleController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Tiêu đề',
//                                   border: UnderlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                               const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: TextField(
//                                 controller: descriptionController,
//                                 decoration: const InputDecoration(
//                                     hintText: 'Mô tả',
//                                     border: InputBorder.none),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       DateTimePicker(
//                         onDateTimeChanged: (newDateTime) {
//                           setState(() {
//                             reminderTime = newDateTime;
//                           });
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (BuildContext context) {
//                               return const RepeatIntervallTime();
//                             },
//                           );
//                         },
//                         child: Container(
//                           height: 55,
//                           width: 350,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.grey[300],
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.only(top: 0, left: 15),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.repeat_on,
//                                   color: Colors.grey,
//                                   size: 42,
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text(
//                                   'Lặp lại',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 SizedBox(width: 160),
//                                 Text(
//                                   'Không',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 SizedBox(width: 1),
//                                 Icon(
//                                   Icons.arrow_forward_ios,
//                                   color: Colors.grey,
//                                   size: 16,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const LocationEnable(),
//                       const SizedBox(height: 20),
//                       PrioritySelector(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


