import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 780,
      width: 390,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 400,
          leading: Row(
            children: [
              TextButton(
                child: const Text(
                  'Cancel',
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
                'New Reminder',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 45),
              TextButton(
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 18,
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
      ),
    );
  }
}

