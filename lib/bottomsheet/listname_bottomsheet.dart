import 'package:flutter/material.dart';
import 'package:todolist/items/task_group_item.dart';

class ListNameBottomsheet extends StatelessWidget {
  const ListNameBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 770,
      width: 390,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 400,
          leading: Column(
            children: [
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10, top: 50)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_back_ios, color: Colors.blue),
                        Text(
                          'Danh sách mới',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Danh sách',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
             const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
              child: Text('Reminder will be created in "Wear"',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),
              )
            ],
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 1),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return TaskGroupItem(
              onTap: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}



