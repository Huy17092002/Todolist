import 'package:flutter/material.dart';
import 'package:todolist/constant/configs.dart';

class RepeatTime extends StatelessWidget {
  const RepeatTime({super.key});

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
