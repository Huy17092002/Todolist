import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';

class ListNameBottomsheet extends StatelessWidget {
  const ListNameBottomsheet({super.key});

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
                      'Danh sách mới',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              const Text(
                'Danh sách',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 1),
          itemBuilder: (BuildContext context, int index) {
            index++;
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.playlist_add_circle, size: 38, color: Colors.redAccent),
                  title: const Text(
                    ' Item',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    print('Item $index');

                    Navigator.pop(
                      context,
                    );
                  },
                ),
                dividerListView,
              ],
            );
          },
        ),
      ),
    );
  }
}