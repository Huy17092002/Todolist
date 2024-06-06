import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DatePickerWidget extends StatelessWidget {
  final bool showDate;
  final Function(bool) onToggle;
  const DatePickerWidget({required this.showDate, required this.onToggle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Date',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 177),
            CupertinoSwitch(value: showDate, onChanged: onToggle),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: showDate ? 350 : 0,
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
        const Divider(
          thickness: 0.8,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class TimePickerWidget extends StatelessWidget {
  final bool showClock;
  final Function(bool) onToggle;
  const TimePickerWidget({required this.showClock, required this.onToggle, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: showClock ? 250 : 40,
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(Icons.query_builder, color: Colors.white),
          ),
          const SizedBox(width: 10),
          const Text(
            'Time',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 177,
          ),
          CupertinoSwitch(value: showClock, onChanged: onToggle),
        ],
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  final bool switchValue;
  final bool showText;
  final Function(bool) onToggle;
  const LocationWidget({required this.showText, required this.switchValue, required this.onToggle, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: switchValue ? 120 : 45,
      width: 350,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.near_me,
                          color: Colors.white,
                          size: 21,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showText)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 15, bottom: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                Icons.near_me,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[600],
                              ),
                              child: const Icon(
                                Icons.directions_car,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[600],
                              ),
                              child: const Icon(
                                Icons.directions_car,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            right: 14,
            top: 3,
            child: CupertinoSwitch(
              value: switchValue,
              onChanged: onToggle,
            ),
          ),
        ],
      ),
    );
  }
}
