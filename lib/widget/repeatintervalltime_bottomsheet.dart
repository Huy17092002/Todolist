import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';
import 'package:todolist/services/notification_service.dart';
import 'package:todolist/view/component/bottomsheet/custom_repeat_bottomsheet.dart';

class RepeatIntervallTime extends StatefulWidget {
  final TaskList taskList;
  final Task task;

  const RepeatIntervallTime({super.key, required this.task, required this.taskList});

  @override
  State<RepeatIntervallTime> createState() => _RepeatIntervallTimeState();
}

class _RepeatIntervallTimeState extends State<RepeatIntervallTime> {
   String repeatOption = 'Không' ;

  @override
  void initState() {
    super.initState();
    repeatOption = Provider.of<TaskViewModel>(context,listen: false).repeatOption;
  }

  void _onTap(BuildContext context, String option) {
    setState(() {
      repeatOption = option;
    });

    Provider.of<TaskViewModel>(context, listen: false).updateRepeatOption(widget.task, option);

    if (widget.task.reminderTime != null) {
      _scheduleNotification(option);
    }
  }

  void _scheduleNotification(String repeatOption) async {
    if (widget.task.reminderTime != null) {
      await NotificationService.setScheduleNotification(
        scheduleDateTime: widget.task.reminderTime!,
        title: widget.task.title,
        body: widget.task.description ?? '',
        id: widget.task.id,
        isPlaySound: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: SizedBox(
        height: 770,
        width: 500,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 400,
            leading: Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 10)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.blue),
                      Text(
                        'Chi tiết',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 70),
                      Text(
                        'Lặp lại',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                child: Container(
                  height: 95,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 1),
                    children: [
                      Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'Không',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: repeatOption == 'Không'
                                ? const Icon(
                              Icons.check_outlined,
                              color: Colors.blueAccent,
                              size: 25,
                            )
                                : null,
                            onTap: () => _onTap(context, 'Không'),
                          ),
                          const Divider(height: 0, thickness: 0.7),
                          ListTile(
                            title: const Text(
                              'Hàng ngày',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: repeatOption == ',Hằng ngày'
                                ? const Icon(
                              Icons.check_outlined,
                              color: Colors.blueAccent,
                              size: 25,
                            )
                                : null,
                            onTap: () => _onTap(context, ',Hằng ngày'),
                          ),
                          ListTile(
                            title: Text(
                              repeatOption != 'Không' ? repeatOption : 'Không',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: repeatOption != 'Không'
                                ? const Icon(
                              Icons.check_outlined,
                              color: Colors.blueAccent,
                              size: 25,
                            )
                                : null,
                            onTap: () => _onTap(context, repeatOption),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  int? selectedDays = await showModalBottomSheet<int>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const CustomRepeatBottomsheet();
                    },
                  );

                  if (selectedDays != null) {
                    setState(() {
                      repeatOption = ',Mỗi $selectedDays ngày';
                    });
                    Provider.of<TaskViewModel>(context, listen: false).updateRepeatOption(widget.task, repeatOption);
                  }
                },
                child: Container(
                  height: 50,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: const ListTile(
                    title: Text(
                      'Tùy chỉnh',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
