import 'package:flutter/material.dart';
import 'package:todolist/tasklistpage/bottomsheet/detail_task/dateclock_detailstask.dart';
import 'package:todolist/tasklistpage/bottomsheet/detail_task/location_detailstask.dart';
import 'package:todolist/tasklistpage/bottomsheet/detail_task/priority_detailstask.dart';
import 'package:todolist/tasklistpage/bottomsheet/detail_task/repeat_time_task.dart';

class DetailsTaskListPageBottomsheet extends StatefulWidget {
  const DetailsTaskListPageBottomsheet({super.key});

  @override
  State<DetailsTaskListPageBottomsheet> createState() => _DetailsTaskListPageBottomsheetState();
}

class _DetailsTaskListPageBottomsheetState extends State<DetailsTaskListPageBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 90),
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
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 112, // Adjusted height to accommodate spacing
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Tieu de',
                                border: UnderlineInputBorder(
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ghi chu',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const DateClock(),
                    const SizedBox(height: 20),
                    const RepeatTimeTask(),
                    const SizedBox(height: 20),
                    const Location(),
                    const SizedBox(height: 20),
                    const Priority(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
