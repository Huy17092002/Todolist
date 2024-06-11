import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DateClock extends StatefulWidget {
  const DateClock({super.key});

  @override
  State<DateClock> createState() => _DateClockState();
}

class _DateClockState extends State<DateClock> {
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
      duration: const Duration(milliseconds: 700),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
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
                    Icons.date_range,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Date',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                CupertinoSwitch(
                  value: showDate,
                  onChanged: _toggleDate,
                ),
              ],
            ),
            AnimatedContainer(
              height: showDate ? 350 : 0,
              duration: const Duration(milliseconds: 400),
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Time',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                CupertinoSwitch(
                  value: showClock,
                  onChanged: _toggleClock,
                ),
              ],
            ),
            AnimatedContainer(
              height: showClock ? 200 : 0,
              duration: const Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child:CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hm,
                    onTimerDurationChanged: (Duration value) {},
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

