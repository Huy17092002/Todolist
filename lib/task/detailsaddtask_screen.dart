import 'package:flutter/material.dart';
import 'package:todolist/widget/location_detailsaddtask_widget.dart';
import 'repeatnewreminder_screen.dart';
import 'package:todolist/widget/priority_detailsaddtask_widget.dart';
import 'package:todolist/widget/dateclock_detailscreen_addtask.dart';

class DetailsAddtask extends StatefulWidget {
  const DetailsAddtask({super.key});

  @override
  State<DetailsAddtask> createState() => _DetailsAddtaskState();
}

class _DetailsAddtaskState extends State<DetailsAddtask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 780,
      width: 390,
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
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                    ),
                    Text(
                      'Lời nhắc mới',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              const Text(
                'Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 90),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Xong'),
                        actions: [
                          ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Add',
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
        body: SingleChildScrollView(
          child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Column(
            children: [
              DateClock(),
              SizedBox(height: 30),
              RepeatNewrenminder(),
              SizedBox(height: 30),
              Location(),
              SizedBox(height: 30),
              Priority(),
            ],
          ),
        ),
      ),
    ),
    );
  }
}