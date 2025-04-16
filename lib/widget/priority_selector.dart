import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/priority.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';

class PrioritySelector extends StatefulWidget {
  final Task task;

  PrioritySelector({super.key, required this.task});

  final List<String> list = <String>['Không', 'Thấp', 'Trung bình', 'Cao'];

  @override
  State<PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  String dropdownValue = 'Không';

  @override
  void initState() {
    super.initState();
    if (widget.task.priority == Priority.none) {
      dropdownValue = widget.list[0];
    } else if (widget.task.priority == Priority.low) {
      dropdownValue = widget.list[1];
    } else if (widget.task.priority == Priority.medium) {
      dropdownValue = widget.list[2];
    } else if (widget.task.priority == Priority.high) {
      dropdownValue = widget.list[3];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(Icons.priority_high,
                      color: Colors.white, size: 29),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Mức ưu tiên',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: DropdownButton<String>(
                key: ValueKey<String>(dropdownValue),
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });

                  Priority updatedPriority;
                  if (newValue == 'Không') {
                    updatedPriority = Priority.none;
                  } else if (newValue == 'Thấp') {
                    updatedPriority = Priority.low;
                  } else if (newValue == 'Trung bình') {
                    updatedPriority = Priority.medium;
                  } else {
                    updatedPriority = Priority.high;
                  }
                  widget.task.priority = updatedPriority;
                  Provider.of<TaskViewModel>(context, listen: false)
                      .updatePriority(widget.task, updatedPriority);
                },
                items:
                    widget.list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black87),
                    ),
                  );
                }).toList(),
                underline: Container(),
                icon: const Icon(Icons.unfold_more, color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
