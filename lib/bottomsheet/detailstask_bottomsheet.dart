import 'package:flutter/material.dart';
import 'package:todolist/bottomsheet/component/dateclock_detailstask.dart';
import 'package:todolist/bottomsheet/component/location_detailstask.dart';
import 'package:todolist/bottomsheet/component/priority_detailstask.dart';
import 'package:todolist/bottomsheet/component/repeat_detailstask.dart';

class DetailsTaskBottomsheet extends StatefulWidget {
  const DetailsTaskBottomsheet({super.key});

  @override
  State<DetailsTaskBottomsheet> createState() => _DetailsTaskBottomsheetState();
}

class _DetailsTaskBottomsheetState extends State<DetailsTaskBottomsheet> {
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
                  style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
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
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                children: [
                  DateClock(),
                  SizedBox(height: 20),
                  RepeatTimeTask(),
                  SizedBox(height: 20),
                  Location(),
                  SizedBox(height: 20),
                  Priority(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
