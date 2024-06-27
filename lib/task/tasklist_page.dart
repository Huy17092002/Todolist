// import 'package:flutter/material.dart';
// import 'package:todolist/bottomsheet/detailstask_bottomsheet.dart';
//
// class TaskListPage extends StatefulWidget {
//   const TaskListPage({super.key});
//
//   @override
//   State<TaskListPage> createState() => TaskListPageState();
// }
//
// class TaskListPageState extends State<TaskListPage> {
//   final List<Widget> _reminderInputs = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 400,
//         leading: Row(
//           children: [
//             const Padding(padding: EdgeInsets.only(left: 10)),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios, color: Colors.blue),
//                   Text(
//                     'Danh sách',
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 155,
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.pending_outlined,
//                 color: Colors.blue,
//               ),
//               onPressed: () {
//                 showMenu(
//                   context: context,
//                   position: const RelativeRect.fromLTRB(10, 99, 9, 0),
//                   items: <PopupMenuEntry>[
//                     PopupMenuItem(
//                       value: Icons.preview,
//                       child: ListTile(
//                         leading: Icon(Icons.info_outline, size: 30),
//                         title: Text('Thông tin danh sách', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.share,
//                       child: ListTile(
//                         leading: Icon(Icons.check_circle_outline, size: 30),
//                         title: Text('Chọn lời nhắc', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.sort_by_alpha,
//                       child: ListTile(
//                         leading: Icon(Icons.import_export, size: 30),
//                         title: Text('Sắp xếp theo', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.remove_red_eye,
//                       child: ListTile(
//                         leading: Icon(Icons.remove_red_eye_outlined, size: 30),
//                         title: Text('Lời nhắc đã hoàn tất', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.print,
//                       child: ListTile(
//                         leading: Icon(Icons.print, size: 30),
//                         title: Text('In', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.delete,
//                       child: ListTile(
//                         leading: Icon(Icons.delete_rounded, color: Colors.red, size: 30),
//                         title: Text('Xóa danh sách', style: TextStyle(fontSize: 18, color: Colors.red)),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//             TextButton(
//               child: const Text(
//                 'Xong',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.blue,
//                 ),
//               ),
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Xong'),
//                       actions: [
//                         ElevatedButton(
//                           child: const Text('OK'),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Text(
//               'View',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _reminderInputs.length,
//               itemBuilder: (context, index) {
//                 return _reminderInputs[index];
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 33,
//           right: 210,
//         ),
//         child: SingleChildScrollView(
//           child: TextButton.icon(
//             icon: const Icon(
//               Icons.add_circle,
//               size: 30,
//               color: Colors.blue,
//             ),
//             label: const Text(
//               'Lời nhắc mới',
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               setState(() {
//                 _reminderInputs.add(
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15, top: 5),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         icon: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
//                         hintText: 'Add note',
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               builder: (BuildContext context) {
//                                 return const DetailsTaskBottomsheet();
//                               },
//                             );
//                           },
//                           child: const Icon(Icons.info_outline),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:todolist/bottomsheet/detailstask_bottomsheet.dart';
//
// class TaskListPage extends StatefulWidget {
//   const TaskListPage({super.key});
//
//   @override
//   State<TaskListPage> createState() => TaskListPageState();
// }
//
// class TaskListPageState extends State<TaskListPage> {
//   final List<Widget> _reminderInputs = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 400,
//         leading: Row(
//           children: [
//             const Padding(padding: EdgeInsets.only(left: 10)),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios, color: Colors.blue),
//                   Text(
//                     'Danh sách',
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 220,
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.pending_outlined,
//                 color: Colors.blue,
//               ),
//               onPressed: () {
//                 showMenu(
//                   context: context,
//                   position: const RelativeRect.fromLTRB(10, 99, 9, 0),
//                   items: <PopupMenuItem>[
//                     const PopupMenuItem(
//                       value: Icons.preview,
//                       child: ListTile(
//                         leading: Text(
//                           'Thông tin danh sách',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         title: Icon(Icons.info_outline),
//                       ),
//                     ),
//                     const PopupMenuItem(
//                       value: Icons.share,
//                       child: ListTile(
//                         leading: Text(
//                           'Chọn lời nhắc',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         title: Icon(Icons.check_circle_outline),
//                       ),
//                     ),
//                     const PopupMenuItem(
//                       child: ListTile(
//                         leading: Text(
//                           'Sắp xếp theo',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         title: Icon(Icons.import_export),
//                       ),
//                     ),
//                     const PopupMenuItem(
//                       child: ListTile(
//                         leading: Text(
//                           'Lời nhắc đã hoàn tất',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         title: Icon(Icons.remove_red_eye_outlined),
//                       ),
//                     ),
//                     const PopupMenuItem(
//                       child: ListTile(
//                         leading: Text(
//                           'In',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         title: Icon(Icons.print),
//                       ),
//                     ),
//                     const PopupMenuItem(
//                         child: ListTile(
//                           leading: Text(
//                             'Xóa danh sách',
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.red
//                             ),
//                           ),
//                           title: Icon(Icons.delete_rounded,color: Colors.red,),
//                         )
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Text(
//               'View',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _reminderInputs.length,
//               itemBuilder: (context, index) {
//                 return _reminderInputs[index];
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 33,
//           right: 210,
//         ),
//         child: SingleChildScrollView(
//           child: TextButton.icon(
//             icon: const Icon(
//               Icons.add_circle,
//               size: 30,
//               color: Colors.blue,
//             ),
//             label: const Text(
//               'Lời nhắc mới',
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               setState(() {
//                 _reminderInputs.add(
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15, top: 5),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         icon: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
//                         hintText: 'Add note',
//                         suffixIcon:
//                         GestureDetector(
//                           onTap: (){
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               builder: (BuildContext context) {
//                                 return const DetailsTaskBottomsheet();
//                               },
//                             );
//                           },
//                           child: const Icon(Icons.info_outline),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// class TaskListPage extends StatefulWidget {
//   const TaskListPage({super.key});
//
//   @override
//   State<TaskListPage> createState() => TaskListPageState();
// }
//
// class TaskListPageState extends State<TaskListPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 400,
//         leading: Row(
//           children: [
//             const Padding(padding: EdgeInsets.only(left: 10)),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios, color: Colors.blue),
//                   Text(
//                     'Danh sách',
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 220,
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.pending_outlined,
//                 color: Colors.blue,
//               ),
//               onPressed: () {
//                 showMenu(
//                   context: context,
//                   position: const RelativeRect.fromLTRB(10, 99, 9, 0),
//                   items: <PopupMenuEntry>[
//                   const  PopupMenuItem(
//                       value: Icons.preview,
//                       child: ListTile(
//                         leading: Icon(Icons.info_outline, size: 30),
//                         title: Text('Thông tin danh sách', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.share,
//                       child: ListTile(
//                         leading: Icon(Icons.check_circle_outline, size: 30),
//                         title: Text('Chọn lời nhắc', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.sort_by_alpha,
//                       child: ListTile(
//                         leading: Icon(Icons.import_export, size: 30),
//                         title: Text('Sắp xếp theo', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.remove_red_eye,
//                       child: ListTile(
//                         leading: Icon(Icons.remove_red_eye_outlined, size: 30),
//                         title: Text('Lời nhắc đã hoàn tất', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.print,
//                       child: ListTile(
//                         leading: Icon(Icons.print, size: 30),
//                         title: Text('In', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: Icons.delete,
//                       child: ListTile(
//                         leading: Icon(Icons.delete_rounded, color: Colors.red, size: 30),
//                         title: Text('Xóa danh sách', style: TextStyle(fontSize: 18, color: Colors.red)),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Text(
//               'View',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (BuildContext context, int index) {
//                 return  ListTile(
//                   leading: Icon(
//                     Icons.playlist_add_circle,
//                     size: 39,
//                     color: Colors.green,
//
//                   ),
//                   title: const Text(
//                     'view',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   trailing: const Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.grey,
//                     size: 17,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 33,
//           right: 210,
//         ),
//         child: SingleChildScrollView(
//           child: TextButton.icon(
//             icon: const Icon(
//               Icons.add_circle,
//               size: 30,
//               color: Colors.blue,
//             ),
//             label: const Text(
//               'Lời nhắc mới',
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               setState(() {});
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../bottomsheet/detailstask_bottomsheet.dart';
//
// class TaskListPage extends StatefulWidget {
//   const TaskListPage({super.key});
//
//   @override
//   State<TaskListPage> createState() => TaskListPageState();
// }
//
// class TaskListPageState extends State<TaskListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 400,
//         leading: Row(
//           children: [
//             const Padding(padding: EdgeInsets.only(left: 10)),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios, color: Colors.blue),
//                   Text(
//                     'Danh sách',
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 220,
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.pending_outlined,
//                 color: Colors.blue,
//               ),
//               onPressed: () {
//                 showMenu(
//                   context: context,
//                   position: const RelativeRect.fromLTRB(10, 99, 9, 0),
//                   items: <PopupMenuEntry>[
//                     const PopupMenuItem(
//                       value: Icons.preview,
//                       child: ListTile(
//                         leading: Icon(Icons.info_outline, size: 30),
//                         title: Text('Thông tin danh sách', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     const PopupMenuDivider(),
//                     const PopupMenuItem(
//                       value: Icons.share,
//                       child: ListTile(
//                         leading: Icon(Icons.check_circle_outline, size: 30),
//                         title: Text('Chọn lời nhắc', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     const PopupMenuDivider(),
//                     const PopupMenuItem(
//                       value: Icons.sort_by_alpha,
//                       child: ListTile(
//                         leading: Icon(Icons.import_export, size: 30),
//                         title: Text('Sắp xếp theo', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     const PopupMenuDivider(),
//                     const PopupMenuItem(
//                       value: Icons.remove_red_eye,
//                       child: ListTile(
//                         leading: Icon(Icons.remove_red_eye_outlined, size: 30),
//                         title: Text('Lời nhắc đã hoàn tất', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     const PopupMenuDivider(),
//                     const PopupMenuItem(
//                       value: Icons.print,
//                       child: ListTile(
//                         leading: Icon(Icons.print, size: 30),
//                         title: Text('In', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                     const PopupMenuDivider(),
//                     const PopupMenuItem(
//                       value: Icons.delete,
//                       child: ListTile(
//                         leading: Icon(Icons.delete_rounded, color: Colors.red, size: 30),
//                         title: Text('Xóa danh sách', style: TextStyle(fontSize: 18, color: Colors.red)),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Text(
//               'View',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       icon: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
//                       hintText: 'Add note',
//                       suffixIcon: GestureDetector(
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               builder: (BuildContext context) {
//                                 return const DetailsTaskBottomsheet();
//                               },
//                             );
//                           },
//                           child: const Icon(Icons.info_outline),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 33,
//           right: 210,
//         ),
//         child: SingleChildScrollView(
//           child: TextButton.icon(
//             icon: const Icon(
//               Icons.add_circle,
//               size: 30,
//               color: Colors.blue,
//             ),
//             label: const Text(
//               'Lời nhắc mới',
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               setState(() {});
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../bottomsheet/detailstask_bottomsheet.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => TaskListPageState();
}

class TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Danh sách',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 220,
            ),
            IconButton(
              icon: const Icon(
                Icons.pending_outlined,
                color: Colors.blue,
              ),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(10, 99, 9, 0),
                  items: <PopupMenuEntry>[
                    const PopupMenuItem(
                      height: 40, // Adjusted height here
                      value: Icons.preview,
                      child: ListTile(
                        leading: Icon(Icons.info_outline, size: 24), // Adjusted icon size
                        title: Text('Thông tin danh sách', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40, // Adjusted height here
                      value: Icons.share,
                      child: ListTile(
                        leading: Icon(Icons.check_circle_outline, size: 24), // Adjusted icon size
                        title: Text('Chọn lời nhắc', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40, // Adjusted height here
                      value: Icons.sort_by_alpha,
                      child: ListTile(
                        leading: Icon(Icons.import_export, size: 24), // Adjusted icon size
                        title: Text('Sắp xếp theo', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40, // Adjusted height here
                      value: Icons.remove_red_eye,
                      child: ListTile(
                        leading: Icon(Icons.remove_red_eye_outlined, size: 24), // Adjusted icon size
                        title: Text('Lời nhắc đã hoàn tất', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40, // Adjusted height here
                      value: Icons.print,
                      child: ListTile(
                        leading: Icon(Icons.print, size: 24), // Adjusted icon size
                        title: Text('In', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 40, // Adjusted height here
                      value: Icons.delete,
                      child: ListTile(
                        leading: Icon(Icons.delete_rounded, color: Colors.red, size: 24), // Adjusted icon size
                        title: Text('Xóa danh sách', style: TextStyle(fontSize: 16, color: Colors.red)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'View',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
                      hintText: 'Add note',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return const DetailsTaskBottomsheet();
                            },
                          );
                        },
                        child: const Icon(Icons.info_outline),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 33,
          right: 210,
        ),
        child: SingleChildScrollView(
          child: TextButton.icon(
            icon: const Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.blue,
            ),
            label: const Text(
              'Lời nhắc mới',
              style: TextStyle(
                fontSize: 17,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:todolist/bottomsheet/detailstask_bottomsheet.dart';
//
// class TaskListPage extends StatefulWidget {
//   const TaskListPage({super.key});
//
//   @override
//   State<TaskListPage> createState() => TaskListPageState();
// }
//
// class TaskListPageState extends State<TaskListPage> {
//   final List<Widget> _reminderInputs = [];
//   bool showTextDone = false; // Trạng thái hiển thị của "Xong"
//   bool showEllipsis = true; // Trạng thái hiển thị của icon ba chấm
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 400,
//         leading: Row(
//           children: [
//             const Padding(padding: EdgeInsets.only(left: 10)),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios, color: Colors.blue),
//                   Text(
//                     'Danh sách',
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 215,
//             ),
//             Visibility(
//               visible: showTextDone, // Hiển thị nút "Xong" nếu showTextDone là true
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     showTextDone = false; // Ẩn nút "Xong"
//                     showEllipsis = false; // Ẩn icon ba chấm
//                   });
//                 },
//                 child: const Text(
//                   'Xong',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: showEllipsis, // Hiển thị icon ba chấm nếu showEllipsis là true
//               child: IconButton(
//                 icon: const Icon(Icons.more_vert),
//                 onPressed: () {
//                   showMenu(
//                     context: context,
//                     position: const RelativeRect.fromLTRB(0, 0, 0, 0),
//                     items: <PopupMenuEntry>[
//                       const PopupMenuItem(
//                         value: Icons.preview,
//                         child: ListTile(
//                           leading: Icon(Icons.info_outline),
//                           title: Text('Thông tin danh sách'),
//                         ),
//                       ),
//                       const PopupMenuItem(
//                         value: Icons.share,
//                         child: ListTile(
//                           leading: Icon(Icons.check_circle_outline),
//                           title: Text('Chọn lời nhắc'),
//                         ),
//                       ),
//                       const PopupMenuItem(
//                         value: Icons.sort_by_alpha,
//                         child: ListTile(
//                           leading: Icon(Icons.import_export),
//                           title: Text('Sắp xếp theo'),
//                         ),
//                       ),
//                       const PopupMenuItem(
//                         value: Icons.remove_red_eye,
//                         child: ListTile(
//                           leading: Icon(Icons.remove_red_eye_outlined),
//                           title: Text('Lời nhắc đã hoàn tất'),
//                         ),
//                       ),
//                       const PopupMenuItem(
//                         value: Icons.print,
//                         child: ListTile(
//                           leading: Icon(Icons.print),
//                           title: Text('In'),
//                         ),
//                       ),
//                       const PopupMenuItem(
//                         value: Icons.delete,
//                         child: ListTile(
//                           leading: Icon(Icons.delete_rounded),
//                           title: Text(
//                             'Xóa danh sách',
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Text(
//               'View',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _reminderInputs.length,
//               itemBuilder: (context, index) {
//                 return _reminderInputs[index];
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 33,
//           right: 210,
//         ),
//         child: SingleChildScrollView(
//           child: TextButton.icon(
//             icon: const Icon(
//               Icons.add_circle,
//               size: 30,
//               color: Colors.blue,
//             ),
//             label: const Text(
//               'Lời nhắc mới',
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               setState(() {
//                 _reminderInputs.add(
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15, top: 5),
//                     child: TextFormField(
//                       onTap: () {
//                         setState(() {
//                           showTextDone = true; // Hiển thị nút "Xong"
//                           showEllipsis = false; // Hiển thị icon ba chấm
//                         });
//                       },
//                       decoration: InputDecoration(
//                         icon: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
//                         hintText: 'Add note',
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               builder: (BuildContext context) {
//                                 return const DetailsTaskBottomsheet();
//                               },
//                             );
//                           },
//                           child: const Icon(Icons.info_outline),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:todolist/bottomsheet/detailstask_bottomsheet.dart';
//
// class TaskListPage extends StatefulWidget {
//   const TaskListPage({super.key});
//
//   @override
//   State<TaskListPage> createState() => TaskListPageState();
// }
//
// class TaskListPageState extends State<TaskListPage> {
//   final List<Widget> _reminderInputs = [];
//   bool showTextDone = false; // Trạng thái hiển thị của "Xong"
//   bool showEllipsis = true; // Trạng thái hiển thị của icon ba chấm
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 400,
//         leading: Row(
//           children: [
//             const Padding(padding: EdgeInsets.only(left: 10)),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios, color: Colors.blue),
//                   Text(
//                     'Danh sách',
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 200,
//             ),
//             if (showTextDone || showEllipsis)
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     if (showTextDone)
//                       TextButton(
//                         onPressed: () {
//                           setState(() {
//                             showTextDone = false; // Ẩn nút "Xong"
//                             showEllipsis = true; // Hiển thị icon ba chấm
//                           });
//                         },
//                         child: const Text(
//                           'Xong',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     if (showTextDone && showEllipsis)
//                       const SizedBox(width: 8), // Khoảng cách giữa "Xong" và icon ba chấm
//                     if (showEllipsis)
//                       IconButton(
//                         icon: const Icon(Icons.more_vert),
//                         onPressed: () {
//                           showMenu(
//                             context: context,
//                             position: const RelativeRect.fromLTRB(0, 0, 0, 0),
//                             items: <PopupMenuEntry>[
//                               const PopupMenuItem(
//                                 value: Icons.preview,
//                                 child: ListTile(
//                                   leading: Icon(Icons.info_outline),
//                                   title: Text('Thông tin danh sách'),
//                                 ),
//                               ),
//                               const PopupMenuDivider(
//
//                               ),
//                               const PopupMenuItem(
//                                 value: Icons.share,
//                                 child: ListTile(
//                                   leading: Icon(Icons.check_circle_outline),
//                                   title: Text('Chọn lời nhắc'),
//                                 ),
//                               ),
//                               const PopupMenuDivider(),
//                               const PopupMenuItem(
//                                 value: Icons.sort_by_alpha,
//                                 child: ListTile(
//                                   leading: Icon(Icons.import_export),
//                                   title: Text('Sắp xếp theo'),
//                                 ),
//                               ),
//                               const PopupMenuDivider(),
//                               const PopupMenuItem(
//                                 value: Icons.remove_red_eye,
//                                 child: ListTile(
//                                   leading: Icon(Icons.remove_red_eye_outlined),
//                                   title: Text('Lời nhắc đã hoàn tất'),
//                                 ),
//                               ),
//                               const PopupMenuDivider(),
//                               const PopupMenuItem(
//                                 value: Icons.print,
//                                 child: ListTile(
//                                   leading: Icon(Icons.print),
//                                   title: Text('In'),
//                                 ),
//                               ),
//                               const PopupMenuDivider(),
//                               const PopupMenuItem(
//                                 value: Icons.delete,
//                                 child: ListTile(
//                                   leading: Icon(Icons.delete_rounded),
//                                   title: Text(
//                                     'Xóa danh sách',
//                                     style: TextStyle(color: Colors.red),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Text(
//               'View',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _reminderInputs.length,
//               itemBuilder: (context, index) {
//                 return _reminderInputs[index];
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 33,
//           right: 210,
//         ),
//         child: SingleChildScrollView(
//           child: TextButton.icon(
//             icon: const Icon(
//               Icons.add_circle,
//               size: 30,
//               color: Colors.blue,
//             ),
//             label: const Text(
//               'Lời nhắc mới',
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               setState(() {
//                 _reminderInputs.add(
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15, top: 5),
//                     child: TextFormField(
//                       onTap: () {
//                         setState(() {
//                           showTextDone = true;
//                           showEllipsis = false;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         icon: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
//                         hintText: 'Add note',
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               builder: (BuildContext context) {
//                                 return const DetailsTaskBottomsheet();
//                               },
//                             );
//                           },
//                           child: const Icon(Icons.info_outline),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:todolist/bottomsheet/detailstask_bottomsheet.dart';
//
// class TaskListPage extends StatefulWidget {
//   const TaskListPage({Key? key}) : super(key: key);
//
//   @override
//   State<TaskListPage> createState() => TaskListPageState();
// }
//
// class TaskListPageState extends State<TaskListPage> {
//   final List<Widget> _reminderInputs = [];
//   bool showTextDone = false; // Trạng thái hiển thị của "Xong"
//   bool showEllipsis = true; // Trạng thái hiển thị của icon ba chấm
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 400,
//         leading: Row(
//           children: [
//             const Padding(padding: EdgeInsets.only(left: 10)),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios, color: Colors.blue),
//                   Text(
//                     'Danh sách',
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 200,
//             ),
//             if (showTextDone || showEllipsis)
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     if (showTextDone)
//                       TextButton(
//                         onPressed: () {
//                           setState(() {
//                             showTextDone = false; // Ẩn nút "Xong"
//                             showEllipsis = true; // Hiển thị icon ba chấm
//                           });
//                         },
//                         child: const Text(
//                           'Xong',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     if (showTextDone && showEllipsis)
//                       const SizedBox(width: 8),
//                     if (showEllipsis)
//                       PopupMenuButton(
//                         icon: Icon(Icons.more_vert),
//                         itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//                           const PopupMenuItem(
//                             value: Icons.preview,
//                             child: ListTile(
//                               leading: Icon(Icons.info_outline),
//                               title: Text('Thông tin danh sách'),
//                             ),
//                           ),
//                           const PopupMenuItem(
//                             value: Icons.share,
//                             child: ListTile(
//                               leading: Icon(Icons.check_circle_outline),
//                               title: Text('Chọn lời nhắc'),
//                             ),
//                           ),
//                           const PopupMenuDivider(),
//                           const PopupMenuItem(
//                             value: Icons.sort_by_alpha,
//                             child: ListTile(
//                               leading: Icon(Icons.import_export),
//                               title: Text('Sắp xếp theo'),
//                             ),
//                           ),
//                           const PopupMenuDivider(),
//                           const PopupMenuItem(
//                             value: Icons.remove_red_eye,
//                             child: ListTile(
//                               leading: Icon(Icons.remove_red_eye_outlined),
//                               title: Text('Lời nhắc đã hoàn tất'),
//                             ),
//                           ),
//                           const PopupMenuDivider(),
//                           const PopupMenuItem(
//                             value: Icons.print,
//                             child: ListTile(
//                               leading: Icon(Icons.print),
//                               title: Text('In'),
//                             ),
//                           ),
//                           const PopupMenuDivider(),
//                           const PopupMenuItem(
//                             value: Icons.delete,
//                             child: ListTile(
//                               leading: Icon(Icons.delete_rounded),
//                               title: Text(
//                                 'Xóa danh sách',
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                             ),
//                           ),
//                         ],
//                         offset: Offset.zero, // Đặt vị trí popup menu về bên phải
//                         padding: EdgeInsets.zero, // Xóa khoảng đệm
//                         initialValue: null, // Không có giá trị ban đầu
//                         tooltip: null, // Không hiển thị tooltip
//                         onCanceled: () {}, // Xử lý khi bị hủy
//                         onSelected: (value) {}, // Xử lý khi được chọn
//                       ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Text(
//               'View',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _reminderInputs.length,
//               itemBuilder: (context, index) {
//                 return _reminderInputs[index];
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 33,
//           right: 210,
//         ),
//         child: SingleChildScrollView(
//           child: TextButton.icon(
//             icon: const Icon(
//               Icons.add_circle,
//               size: 30,
//               color: Colors.blue,
//             ),
//             label: const Text(
//               'Lời nhắc mới',
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               setState(() {
//                 _reminderInputs.add(
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15, top: 5),
//                     child: TextFormField(
//                       onTap: () {
//                         setState(() {
//                           showTextDone = true; // Hiển thị nút "Xong"
//                           showEllipsis = false; // Ẩn icon ba chấm
//                         });
//                       },
//                       decoration: InputDecoration(
//                         icon: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
//                         hintText: 'Add note',
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               builder: (BuildContext context) {
//                                 return const DetailsTaskBottomsheet();
//                               },
//                             );
//                           },
//                           child: const Icon(Icons.info_outline),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
