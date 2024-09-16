import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';

import 'custom_repeat_bottomsheet.dart';

class RepeatIntervallTime extends StatelessWidget {
  const RepeatIntervallTime({super.key});

  void _onTap(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: SizedBox(
        height: 770,
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
                        'Lặp lại',
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                child: Container(
                  height: 110,
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
                              'Không bao giờ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.check_outlined,
                              color: Colors.blueAccent,
                              size: 25,
                            ),
                            onTap: () => _onTap(context),
                          ),
                          dividerRepeatBottomSheet,
                          ListTile(
                            title: const Text(
                              'Hàng ngày',
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
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const CustomRepeatBottomsheet();
                    },
                  );
                },
                child: Container(
                  height: 55,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: ListTile(
                    title: const Text(
                      'Custom',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
