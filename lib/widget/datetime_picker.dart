import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DateTimePicker extends StatefulWidget {
  final Function(DateTime?) onDateTimeChanged;

  const DateTimePicker({super.key, required this.onDateTimeChanged});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  bool showDate = false;
  bool showClock = false;
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    DateTime initial = DateTime.now();
    selectedTime = DateTime(initial.year, initial.month, initial.day, initial.hour);
  }

  void _toggleDate(bool value) {
    setState(() {
      showDate = value;
    });
  }

  void _toggleClock(bool value) {
    setState(() {
      showClock = value;
      if (value) {
        showDate = true;
      }
    });
  }

  void _updateSelectedDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
    widget.onDateTimeChanged(DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    ));
  }

  void _updateSelectedTime(DateTime newTime) {
    setState(() {
      selectedTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        newTime.hour,
        newTime.minute,
      );
    });
    widget.onDateTimeChanged(selectedTime);
  }

  @override
  Widget build(BuildContext context) {
    List<String> weekDays = [
      'CN', 'Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7'
    ];
    String weekDay = weekDays[selectedDate.weekday % 7];
    String day = selectedDate.day.toString();
    String month = selectedDate.month.toString();
    String year = selectedDate.year.toString();

    String hour = selectedTime.hour.toString();
    String minute = selectedTime.minute.toString();

    return AnimatedContainer(
      width: 350,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 1, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      size: 37,
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 100, top: 5),
                      child: Text(
                        'Ngày',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    if (showDate)
                      Text(
                        '$weekDay, $day/$month/$year',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 70),
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: CupertinoSwitch(
                    value: showDate,
                    onChanged: _toggleDate,
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              height: showDate && !showClock ? 290 : 0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (showDate)
                        SizedBox(
                          height: 290,
                          width: 370,
                          child: CalendarDatePicker(
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            onDateChanged: _updateSelectedDate,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(thickness: 0.8, color: Colors.grey),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      size: 37,
                      Icons.access_time_filled,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 110, top: 2),
                      child: Text(
                        'Thời gian',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    if (showClock)
                      Padding(
                        padding: const EdgeInsets.only(right: 142),
                        child: Text(
                          '$hour:$minute',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 24),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoSwitch(
                    value: showClock,
                    onChanged: _toggleClock,
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              height: showClock ? 200 : 10,
              duration: const Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: true,
                      minuteInterval: 5,
                      initialDateTime: selectedTime,
                      onDateTimeChanged: _updateSelectedTime,
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
