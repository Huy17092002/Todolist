import 'package:flutter/material.dart';
import 'package:todolist/widget/details_newrenmider_widget.dart';
import 'package:todolist/widget/list_newreminder_widget.dart';


class NewReminder extends StatelessWidget {
  const NewReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 780,
      width: 390,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 400,
          leading: Row(
            children: [
              TextButton(
                child: const Text(
                  'Hủy',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 60,
              ),
              const Text(
                'Lời nhắc mới',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 70),
              TextButton(
                child: const Text(
                  'Thêm',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Xong'),
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
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tiêu đề',
                      helperText: 'Ghi chú',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             const DetailsNewReminDer(),
              const SizedBox(
                height: 20,
              ),
           const ListNewReminder(),
            ],
          ),
        ),
      ),
    );
  }
}

