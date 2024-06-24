import 'package:flutter/material.dart';
import 'package:todolist/task/detailstask_screen.dart';


class DetailsNewReminDer extends StatelessWidget {
  const DetailsNewReminDer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const DetailsTask();
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
          ),
        ],
      ),
    );
  }
}
