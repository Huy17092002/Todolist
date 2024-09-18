import 'package:flutter/material.dart';

import '../task/bottomsheet/detailstask_bottomsheet.dart';


class DetailsNewReminder extends StatelessWidget {
  const DetailsNewReminder({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const DetailsTaskBottomsheet();
              },
            );
          },
          child: Container(
            height: 45,
            width: 352,
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
    );
  }
}
