import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';

class RepeatIntervallTime extends StatelessWidget {
  const RepeatIntervallTime({super.key});

  void _onTap(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                height: 555,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: ListView(
                  padding: const EdgeInsets.only(top: 1),
                  children: [
                    Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Never',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          trailing: const Icon(Icons.check_outlined,color: Colors.blueAccent,size: 25,),
                          onTap: () => _onTap(context),
                        ),
                       dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Daily',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                        dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Weekdays',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                        dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Weekends',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                        dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Weekly',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                        dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Biweekly',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                        dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Monthly',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                        dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Every 3 Months',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                        dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Every 6 Months',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                        dividerRepeatBottomSheet,
                        ListTile(
                          title: const Text(
                            'Yearly',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () => _onTap(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
