import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/configs.dart' ;

class LocationEnable  extends StatefulWidget {
  const LocationEnable({super.key});

  @override
  State<LocationEnable> createState() => _LocationEnableState();
}

class _LocationEnableState extends State<LocationEnable> {
  bool switchValue = false;
  bool showText = false;

  void onToggle(bool value) {
    setState(() {
      switchValue = value;
      showText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: switchValue ? 120 : 45,
      width: 350,
      duration: kDuration,
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
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.near_me,
                          color: Colors.white,
                          size: 21,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          'Vị trí',
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