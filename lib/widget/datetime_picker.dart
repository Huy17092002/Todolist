import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  bool showDate = false;
  bool showClock = false;

  void _toggleDate(bool value) {
    setState(() {
      showDate = value;
      showClock = false;
    });
  }

  void _toggleClock(bool value) {
    setState(() {
      showClock = value;
      showDate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 350,
      duration:  const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10), 
                const Text(
                  'Ngày',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 173,
                ),
                CupertinoSwitch(
                  value: showDate,
                  onChanged: _toggleDate,
                ),
              ],
            ),
            AnimatedContainer(
              height: showDate ? 320 : 0,
              duration:  const Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (DateTime value) {},
                  ),
                ),
              ),
            ),
            const Divider(thickness: 0.8, color: Colors.grey),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.access_time_filled,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Thời gian',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 138),
                CupertinoSwitch(
                  value: showClock,
                  onChanged: _toggleClock,
                ),
              ],
            ),
            AnimatedContainer(
              height: showClock ? 210 : 0,
              duration:  const Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: true,
                      onDateTimeChanged: (value) {},
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
