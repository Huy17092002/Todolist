import 'package:flutter/material.dart';


void main() => runApp(const ContainerApp());

class ContainerApp extends StatelessWidget {
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Container')),
        body: Center(
          child: Container(
            width:  598,
            height: 52,
            color: Colors.blue,
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onDateChanged: (DateTime value) {},
            ),
          ),
        ),
      ),
    );
  }
}






