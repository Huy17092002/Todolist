// // import 'package:flutter/material.dart';
// //
// //
// // import '../bottomsheet/details_tasklistpage.dart';
// //
// // class TaskItems extends StatefulWidget {
// //   const TaskItems({super.key});
// //
// //   @override
// //   State<TaskItems> createState() => _TaskItemsState();
// // }
// //
// // class _TaskItemsState extends State<TaskItems> {
// //   bool isChecked = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
//     // return Padding(
//     //   padding: const EdgeInsets.only(left: 15, top: 5),
//     //   child: Row(
//     //     children: [
//     //       Padding(
//     //         padding: const EdgeInsets.only(right: 12),
//     //         child: GestureDetector(
//     //           onTap: () {
//     //             setState(() {
//     //               isChecked = !isChecked;
//     //             });
//     //           },
//     //           child: (() {
//     //             if (isChecked) {
//     //               return const Icon(
//     //                 Icons.radio_button_checked,
//     //                 size: 27,
//     //                 color: Colors.blueAccent,
//     //               );
//     //             } else {
//     //               return const Icon(
//     //                 Icons.radio_button_unchecked,
//     //                 size: 27,
//     //                 color: Colors.grey,
//     //               );
//     //             }
//     //           })(),
//     //         ),
//     //       ),
//     //       Expanded(
//     //         child: TextFormField(
//     //           decoration: InputDecoration(
//     //             hintText: 'Add note',
//     //             suffixIcon: GestureDetector(
//     //               onTap: () {
//     //                 showModalBottomSheet(
//     //                   context: context,
//     //                   isScrollControlled: true,
//     //                   builder: (BuildContext context) {
//     //                     return const DetailsTaskListPageBottomsheet();
//     //                   },
//     //                 );
//     //               },
//     //               child: const Icon(Icons.info_outline),
//     //             ),
//     //           ),
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );
// //   }
// // }
//
// //
// // // import 'package:flutter/material.dart';
// // //
// // // import '../bottomsheet/details_tasklistpage.dart';
// // //
// // // class TaskItems extends StatefulWidget {
// // //   const TaskItems({super.key});
// // //
// // //   @override
// // //   State<TaskItems> createState() => _TaskItemsState();
// // // }
// // //
// // // class _TaskItemsState extends State<TaskItems> {
// // //   bool isChecked = false;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(left: 15, top: 5),
// // //       child: Row(
// // //         children: [
// // //           Padding(
// // //             padding: const EdgeInsets.only(right: 12),
// // //             child: GestureDetector(
// // //               onTap: () {
// // //                 setState(() {
// // //                   isChecked = !isChecked;
// // //                 });
// // //               },
// // //               child: (() {
// // //                 if (isChecked) {
// // //                   return const Icon(
// // //                     Icons.radio_button_checked,
// // //                     size: 27,
// // //                     color: Colors.blueAccent,
// // //                   );
// // //                 } else {
// // //                   return const Icon(
// // //                     Icons.radio_button_unchecked,
// // //                     size: 27,
// // //                     color: Colors.grey,
// // //                   );
// // //                 }
// // //               })(),
// // //             ),
// // //           ),
// // //           Expanded(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Padding(
// // //                   padding: const EdgeInsets.only(left: 0),
// // //                   child: TextField(
// // //                     decoration: InputDecoration(
// // //                       hintText: '',
// // //                       border: InputBorder.none,
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 TextField(
// // //                   decoration: InputDecoration(
// // //                     border: UnderlineInputBorder(),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
//
// import 'package:flutter/material.dart';
//
// import '../model/task.dart';
//
// class TaskItem extends StatelessWidget {
//   final Task task;
//   final Function(Task) onTaskUpdated;
//
//   const TaskItem({
//     Key? key,
//     required this.task,
//     required this.onTaskUpdated,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           contentPadding: const EdgeInsets.symmetric(horizontal: 8),
//           leading: IconButton(
//             icon: Icon(
//               task.isCompleted ? Icons.radio_button_checked : Icons.radio_button_unchecked,
//               color: task.isCompleted ? Colors.blue : Colors.grey,size: 30,
//             ),
//             onPressed: () {
//               final updatedTask = Task(
//                 title: task.title,
//                 description: task.description,
//                 isCompleted: !task.isCompleted,
//               );
//               onTaskUpdated(updatedTask);
//             },
//           ),
//           title: Text(task.title,style: TextStyle(fontSize: 18),),
//           subtitle: Text(task.description,style: TextStyle(fontSize: 18),),
//         ),
//         const Divider(height: 1.0, color: Colors.grey, indent: 65),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task) onTaskUpdated;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onTaskUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          leading: IconButton(
            icon: Icon(
              task.isCompleted ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: task.isCompleted ? Colors.blue : Colors.grey,size: 30,
            ),
            onPressed: () {},
          ),
          title: Text(task.title),
          subtitle: Text('${task.description}\n${task.deadline ?? "No deadline"}\nRepeat: ${task.repeat}\nPriority: ${task.priority.toString().split('.').last}'),
          isThreeLine: true,
        ),
        const Divider(height: 1.0, color: Colors.grey,indent: 65),
      ],
    );
  }
}
