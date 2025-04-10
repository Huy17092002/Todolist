import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/services/notification_service.dart';

class CustomRepeatBottomsheet extends StatefulWidget {
  const CustomRepeatBottomsheet({super.key});

  @override
  CustomRepeatBottomsheetState createState() => CustomRepeatBottomsheetState();
}

class CustomRepeatBottomsheetState extends State<CustomRepeatBottomsheet> {
  bool _isExpanded = false;
  int _selectedValue = 0;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _onSaveButtonPressed() {
    int daysInterval = _selectedValue;
    String title = 'Thông báo lặp lại';
    String body = 'Sự kiện sẽ diễn ra sau mỗi $_selectedValue ngày';

    NotificationService.setPeriodicNotification(
      id: 0,
      title: title,
      body: body,
      isPlaySound: true,
      daysInterval: daysInterval,
    );

    Navigator.pop(context, daysInterval);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: SizedBox(
        height: 700,
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
                        'Lặp lại',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 80),
                      Text(
                        'Custom',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 110),
                GestureDetector(
                  onTap: _onSaveButtonPressed,
                  child: const Text('Lưu',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      )),
                )
              ],
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isExpanded ? 270 : 130,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          'Tần suất',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: Text(
                          'Hàng ngày ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Divider(indent: 17),
                      ListTile(
                        title: const Text(
                          'Mỗi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: Text(
                          '$_selectedValue ngày',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                        onTap: _toggleExpansion,
                      ),
                      if (_isExpanded)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 300,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: CupertinoPicker(
                                        itemExtent: 30.0,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            _selectedValue = index;
                                          });
                                        },
                                        children: List<Widget>.generate(1000,
                                            (int index) {
                                          return Center(child: Text('$index'));
                                        }),
                                      ),
                                    ),
                                    const Text(
                                      'Ngày',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sự kiện sẽ diễn ra sau mỗi $_selectedValue ngày',
                    style: const TextStyle(fontSize: 12, color: Colors.black),
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
