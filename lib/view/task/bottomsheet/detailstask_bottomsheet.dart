import 'package:flutter/material.dart';
import 'package:todolist/view/component/bottomsheet/repeatintervalltime_bottomsheet.dart';
import 'package:todolist/widget/datetime_picker.dart';
import 'package:todolist/widget/location_selector.dart';
import 'package:todolist/widget/priority_selector.dart';

class DetailsTaskBottomsheet extends StatefulWidget {
  const DetailsTaskBottomsheet({super.key});

  @override
  State<DetailsTaskBottomsheet> createState() => _DetailsTaskBottomsheetState();
}

class _DetailsTaskBottomsheetState extends State<DetailsTaskBottomsheet> {
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
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  children: [
                    const DateTimePicker(),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const RepeatIntervallTime();
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
                                'Lặp lại',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 160),
                              Text(
                                'Không',
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
                    ),
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
