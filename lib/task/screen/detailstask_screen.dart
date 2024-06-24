import 'package:flutter/material.dart';
import 'package:todolist/constant/configs.dart';
import 'package:todolist/task/screen/components/location_detailsnewreminder_widget.dart';
import 'package:todolist/task/screen/components/repeatdetailstask_widget.dart';
import 'package:todolist/task/screen/components/priority_detailsnewreminder_widget.dart';
import 'package:todolist/task/screen/components/dateclock_detailsnewreminder_widget.dart';


class DetailsTask extends StatefulWidget {
  const DetailsTask({super.key});

  @override
  State<DetailsTask> createState() => _DetailsTaskState();
}

class _DetailsTaskState extends State<DetailsTask> {
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
                        fontSize: 17,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              const Text(
                'Chi Tiết',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 70),
        TextButton(
          child: const Text(
            'Thêm',
            style: textstyleThem,
          ),
          onPressed: () {
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
              SizedBox(height:30),
              RepeatNewreminder(),
              SizedBox(height:30),
              Location(),
              SizedBox(height:30),
              Priority(),
            ],
          ),
        ),
      ),
    ),
    );
  }
}