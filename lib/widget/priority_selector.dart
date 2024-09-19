// import 'package:flutter/material.dart';
//
// class PrioritySelector extends StatefulWidget {
//   PrioritySelector({super.key});
//
//   final List<String> list = <String>['None', 'Low', 'Medium', 'High'];
//
//   @override
//   State<PrioritySelector> createState() => _PrioritySelectorState();
// }
//
// class _PrioritySelectorState extends State<PrioritySelector> {
//   late String dropdownValue;
//
//   @override
//   void initState() {
//     super.initState();
//     dropdownValue = widget.list.first;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 45,
//       width: 350,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[300],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 15),
//             child: Row(
//               children: [
//                 Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: const Icon(Icons.priority_high,
//                       color: Colors.white, size: 20),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(
//                   'Mức ưu tiên',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//           ),
//           DropdownButton<String>(
//             value: dropdownValue,
//             onChanged: (String? newValue) {
//               setState(() {
//                 dropdownValue = newValue!;
//               });
//             },
//             items: widget.list.map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value,style: TextStyle(fontWeight: FontWeight.normal),),
//               );
//             }).toList(),
//             underline: Container(),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PrioritySelector extends StatefulWidget {
  PrioritySelector({super.key});

  final List<String> list = <String>['None', 'Low', 'Normal', 'High'];

  @override
  State<PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
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
              ],
            ),
          ),
          Row(
            children: [

              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: widget.list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.black87),),
                  );
                }).toList(),
                underline: Container(),
                icon: const Icon(Icons.unfold_more, color: Colors.black45),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
