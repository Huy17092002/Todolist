import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PrioritySection extends StatefulWidget {
  const PrioritySection({super.key});

  @override
  State<PrioritySection> createState() => _PrioritySectionState();
}

class _PrioritySectionState extends State<PrioritySection> {
  String priority = 'Low';

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const Icon(
              Icons.flag,
              color: Colors.grey,
              size: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              'Priority',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 160),
            GestureDetector(
              onTap: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(5, 255, 0, 0),
                  items: <PopupMenuItem>[
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Text(
                          'None',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Text(
                          'Low',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Text(
                          'Medium',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              child: const Row(
                children: [
                  Text(
                    'None',
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
            ),
          ],
        ),
      ),
    );
  }
}