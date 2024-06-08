import 'package:flutter/material.dart';
import '../screens/class_detailscreen.dart';

class Chitiet extends StatelessWidget {
  const Chitiet({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const DetailsScreen();
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
          padding: EdgeInsets.only(top: 2, left: 20),
          child: Row(
            children: [
              Text(
                'Chi tiết',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 238),
              Icon(
                Icons.arrow_forward_ios,
                size: 19,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}