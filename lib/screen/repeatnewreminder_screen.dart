import 'package:flutter/material.dart';
import 'package:todolist/screen/repeatscreen_screen.dart';

class RepeatNewrenminder extends StatelessWidget {
  const RepeatNewrenminder({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const RepeatScreen();
          },
        );
      },
      child: Container(
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 0, left: 15),
          child: Row(
            children: [
              Icon(
                Icons.repeat_on,
                color: Colors.grey,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Repeat',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 160),
              Text(
                'Never',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 1),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
