import 'package:flutter/material.dart' ;

class Priority extends StatefulWidget {
  const Priority({super.key});

  @override
  State<Priority> createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final offset = renderBox.localToGlobal(Offset.zero);
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
              offset.dx + renderBox.size.width,
              offset.dy,
              0,
              offset.dy + renderBox.size.height
          ),
          items: <PopupMenuEntry>[
            const PopupMenuItem(
              child: ListTile(
                leading: Text(
                  'Không có',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              child: ListTile(
                leading: Text(
                  'Thấp',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              child: ListTile(
                leading: Text(
                  'Trung bình',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              child: ListTile(
                leading: Text(
                  'Cao',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        );
      },
      child: Container(
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 15),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(Icons.priority_high,
                    color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
              const Text(
                'Mức ưu tiên',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 90),
              const Row(
                children: [
                  Text(
                    'Không có',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Icon(
                    Icons.unfold_more,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}