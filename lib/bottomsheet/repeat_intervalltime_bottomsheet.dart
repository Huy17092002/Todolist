import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';

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
                              'Không',
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
                              'Hàng giờ',
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
                              'Hàng ngày',
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
                              'Ngày thường',
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
                              'Cuối tuần',
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
                              'Hàng tuần',
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
                              'Hai tuần 1 lần',
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
                              'Hàng tháng',
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
                              'Mỗi 3 tháng',
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
                              'Hàng năm',
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
      ),
    );
  }
}
