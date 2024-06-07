import 'package:flutter/material.dart';


class TitleNoteWidget extends StatelessWidget {
  const TitleNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Title',
            helperText: 'Notes',
          ),
        ),
      ),
    );
  }
}