import 'package:flutter/material.dart';

class ListAddtaskWidget extends StatelessWidget {
  const ListAddtaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child:const Padding(
        padding: EdgeInsets.only(top: 2, left: 15),
        child: Row(
          children: [
            Icon(
              Icons.playlist_add_circle,
              color: Colors.green,
              size: 36,
            ),
            SizedBox(width: 10),
            Text(
              'List',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 160,),
            Text(
              'Wear',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}