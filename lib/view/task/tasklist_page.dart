import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/component/items/task_item.dart';
import 'package:todolist/view/home/bottomsheet/list_info_bottomsheet.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

class TaskListPage extends StatefulWidget {
  final TaskList taskList;

  const TaskListPage({
    super.key,
    required this.taskList,
  });

  @override
  State<TaskListPage> createState() => TaskListPageState();
}

class TaskListPageState extends State<TaskListPage> {
  Task? selectedTask;
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        if (selectedTask != null &&
            selectedTask!.title.isEmpty) {
          Provider.of<TaskViewModel>(context, listen: false)
              .deleteTask(widget.taskList, selectedTask!);
          FocusScope.of(context).unfocus();
          setState(() {
            selectedTask = null;
          });
        } else if (selectedTask != null) {
          FocusScope.of(context).unfocus();
          setState(() {
            selectedTask = null;
          });
        }else {
          FocusScope.of(context).unfocus();
        }

      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 400,
          actions: [
            IconButton(
              icon: selectedTask == null
                  ? const Icon(
                Icons.pending_outlined,
                color: Colors.blue,
              )
                  : GestureDetector(
                onTap: () {
                  if (selectedTask != null &&
                      selectedTask!.title.isEmpty) {
                    Provider.of<TaskViewModel>(context, listen: false)
                        .deleteTask(widget.taskList, selectedTask!);
                    FocusScope.of(context).unfocus();
                    setState(() {
                      selectedTask = null;
                    });
                  } else if (selectedTask != null) {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      selectedTask = null;
                    });
                  }else {
                    FocusScope.of(context).unfocus();
                  }
                },
                child: const Text(
                  'Xong',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(10, 99, 9, 0),
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      child: const ListTile(
                        leading: Icon(Icons.info_outline, size: 30),
                        title: Text(
                          'Thông tin danh sách',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return ListInfoBottomsheet(
                              tasklist: widget.taskList,
                            );
                          },
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: const ListTile(
                        leading: Icon(Icons.import_export, size: 30),
                        title: Text(
                          'Sắp xếp theo độ ưu tiên',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onTap: () {
                        Provider.of<TaskViewModel>(context, listen: false)
                            .sortTasksByPriority(widget.taskList);
                      },
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                        title: const Text(
                          'Xóa danh sách',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Provider.of<TaskListCollectionViewModel>(
                              context, listen: false)
                              .deleteTaskList(widget.taskList);
                          Future.delayed(const Duration(milliseconds: 300), () {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
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
                      'Danh sách',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Consumer<TaskListCollectionViewModel>(
                  builder: (context, taskListCollectionViewModel, child) {
                    return Text(
                      widget.taskList.title,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: widget.taskList.color,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<TaskViewModel>(
                  builder: (context, taskViewModel, child) {
                    return ListView.builder(
                      itemCount: widget.taskList.tasks.length,
                      itemBuilder: (context, index) {
                        final task = widget.taskList.tasks[index];
                        return TaskItem(
                          task: task,
                          taskList: widget.taskList,
                          onTaskSelected: (task) {
                            setState(() {
                              selectedTask = task;
                            });
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2, right: 220),
              child: SingleChildScrollView(
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.add_circle,
                    size: 30,
                    color: Colors.blue,
                  ),
                  label: const Text(
                    'Lời nhắc mới',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    final newTask = Task(
                      id: 0,
                      title: '',
                      description: '',
                      isCompleted: false,
                    );
                    setState(() {
                      selectedTask = newTask;
                    });
                    Provider.of<TaskViewModel>(context, listen: false)
                        .addTaskToTaskList(widget.taskList, newTask);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
