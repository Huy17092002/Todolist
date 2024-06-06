import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool switchValue = false;
  bool showText = false;
  bool showDate = false;
  bool showClock = false;

  void onToggle(bool value) {
    setState(() {
      switchValue = value;
      showText = value;
    });
  }

  void _toggleCustomDatePicker(bool value) {
    setState(() {
      showDate = value;
      showClock = false;
    });
  }

  void _toggleCustomClock(bool value) {
    setState(() {
      showClock = value;
      showDate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 770,
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
              const SizedBox(
                width: 90,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Thank you very much'),
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
            child: Column(
              children: [
                AnimatedContainer(
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
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Date',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 177,
                            ),
                            CupertinoSwitch(
                              value: showDate,
                              onChanged: _toggleCustomDatePicker,
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
                        const Divider(
                          thickness: 0.8,
                          color: Colors.grey,
                        ),
                        AnimatedContainer(
                          height: showClock ? 200 : 43,
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                            children: [
                              Row(
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
                                      Icons.query_builder,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
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
                                  CupertinoSwitch(
                                    value: showClock,
                                    onChanged: _toggleCustomClock,
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: showClock,
                                child: Flexible(
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: DateTime.now(),
                                    use24hFormat: true,
                                    onDateTimeChanged: (DateTime newDateTime) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const RepeatScreen();
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
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Repeat',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Text(
                            'Never',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
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
                const SizedBox(
                  height: 30,
                ),
                AnimatedContainer(
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
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2, left: 15),
                    child: Row(
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
                            Icons.priority_high,
                            color: Colors.white,
                            size: 21,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Priority',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 170,
                        ),
                        GestureDetector(
                          onTap: () {
                            showMenu(
                              context: context,
                              position: const RelativeRect.fromLTRB(5, 255, 0, 0),
                              items: <PopupMenuItem>[
                                const PopupMenuItem(
                                  child: ListTile(
                                    leading: Text(
                                      'None',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                const PopupMenuItem(
                                  child: ListTile(
                                    leading: Text(
                                      'Low',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                const PopupMenuItem(
                                  child: ListTile(
                                    leading: Text(
                                      'Medium',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          child: const Row(
                            children: [
                              Text(
                                'None',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Icon(
                                Icons.unfold_more,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RepeatScreen extends StatelessWidget {
  const RepeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 770,
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
                    Icon(Icons.arrow_back_ios, color: Colors.blue),
                    Text(
                      'Chi tiết',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Repeat',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 450,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 1),
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    index++;
                    return const Column(
                      children: [
                        ListTile(
                          title: Text(
                            'view',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 0.8,
                          indent: 10,
                          endIndent: 0,
                          height: 0.2,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
