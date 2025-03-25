import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/home/bottomsheet/list_info_bottomsheet.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

class TaskListItem extends StatelessWidget {
  final VoidCallback onTap;
  final TaskList model;

  const TaskListItem({
    super.key,
    required this.onTap,
    required this.model,
  });

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
                  return  ListInfoBottomsheet(tasklist: model);
                },
              );
            },
            backgroundColor: const Color(0xFFBDBDBD),
            foregroundColor: Colors.white,
            icon: Icons.info,
          ),
          SlidableAction(
            onPressed: (context) {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Delete list?'),
                  content: const Text(
                    'This will delete all reminders in this list.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  actions: <CupertinoDialogAction>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Provider.of<TaskListCollectionViewModel>(context, listen: false).deleteTaskList(model);
                        Navigator.pop(context);
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 35,
              height: 33,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: model.color,
              ),
              child: Icon(
                model.icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            title: Text(
              model.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: onTap,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 17,
            ),
          ),
          Divider(
            height: 1.0,
            color: Colors.grey[350],
            indent: 58,
            endIndent: 5,
          ),
        ],
      ),
    );
  }
}



