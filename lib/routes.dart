import 'package:flutter/material.dart';
import 'widget/class_widget.dart';
import 'screen/class_detailscreen.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  print('view $index');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTaskScreen(),
                    ),
                  );
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
    );
  }
}


class ListAddtask extends StatelessWidget {
  const ListAddtask({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const ListScreen();
          },
        );
      },
      child: Container(
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 2, left: 15),
          child: Row(
            children: [
              Icon(
                Icons.playlist_add_circle,
                color: Colors.green,
                size: 36,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'List',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 175,
              ),
              Text(
                'Wear',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Chitiet extends StatelessWidget {
  const Chitiet({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const DetailsScreen();
          },
        );
      },
      child: Container(
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 2, left: 20),
          child: Row(
            children: [
              Text(
                'Chi tiết',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 238),
              Icon(
                Icons.arrow_forward_ios,
                size: 19,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RepeatSection extends StatelessWidget {
  const RepeatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const RepeatScreen();
          },
        );
      },
      child: Container(
        height: 45,
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
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Repeat',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 160),
              Text(
                'Never',
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
    );
  }
}


