import 'package:flutter/material.dart';
import 'date_clock_detailscreen.dart';
import 'priority_DetailScreen.dart';
import 'package:todolist/screens/repeat.detailscreen.dart';
import 'location_DetailScreen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
              const SizedBox(width: 90),
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
          child: const Column(
            children: [
              DateClockSection(),
              SizedBox(height: 30),
              RepeatSection(),
              SizedBox(height: 30),
              LocationSection(),
              SizedBox(height: 30),
              PrioritySection(),
            ],
          ),
        ),
      ),
    ),
    );
  }
}