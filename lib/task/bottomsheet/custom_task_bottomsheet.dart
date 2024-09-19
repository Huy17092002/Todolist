import 'package:flutter/material.dart';

import '../../widget/datetime_picker.dart';
import '../../widget/location_selector.dart';
import '../../widget/priority_selector.dart';
import '../../widget/repeat_selector.dart';

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
                      height: 112,
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
                                hintText: 'Tiêu đề',
                                border: UnderlineInputBorder(
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ghi chú',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const DateTimePicker(),
                    const SizedBox(height: 20),
                    const RepeatSelector(),
                    const SizedBox(height: 20),
                    const LocationEnable(),
                    const SizedBox(height: 20),
                     PrioritySelector(),
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
