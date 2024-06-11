import 'package:flutter/material.dart';
import 'screen/listscreen_screen.dart';
import 'widget/listaddtask_widget.dart';
import 'screen/detailsaddtask_screen.dart';
import 'widget/detailsaddtaskwidget_widget.dart';
import 'widget/listwidgetnewreminder_widget.dart';
import 'screen/repeat_screen.dart';
import 'screen/addtaskscreen_screen.dart';

class ListAddtask extends StatelessWidget {
  const ListAddtask({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToListScreen(context);
      },
      child: const ListAddtaskWidget(),
    );
  }

  void _navigateToListScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListScreen()),
    );
  }
}

class DetailAddtask extends StatelessWidget {
  const DetailAddtask({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToDetailsScreen(context);
      },
      child: const DetailsAddtaskWidget(),
    );
  }

  void _navigateToDetailsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetailsAddtask()),
    );
  }
}

class RepeatDetailScreen extends StatelessWidget {
  const RepeatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _RepeatScreen(context);
      },
      child: const ListWidgetNewReminder(),
    );
  }

  void _RepeatScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RepeatScreen()),
    );
  }
}

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 0.25),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        height: MediaQuery.of(context).size.height - 260,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            index++;
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.playlist_add_circle, size: 38, color: Colors.blueAccent),
                  title: const Text(
                    'view',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    _navigateToAddTaskScreen(context);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 17,
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0.5,
                  indent: 70,
                  endIndent: 0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _navigateToAddTaskScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    );
  }
}
