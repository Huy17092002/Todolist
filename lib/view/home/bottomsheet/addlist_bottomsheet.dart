import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

class AddListBottomsheet extends StatefulWidget {
  const AddListBottomsheet({super.key});

  @override
  State<AddListBottomsheet> createState() => _AddListBottomsheetState();
}

class _AddListBottomsheetState extends State<AddListBottomsheet> {
  Color? selectedColor;
  final TextEditingController _nameController = TextEditingController();
  bool showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        showClearIcon = _nameController.text.isNotEmpty;
      });
    });
  }

  Widget buildColorContainer(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: selectedColor == color ? Border.all(color: Colors.grey, width: 4) : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: SizedBox(
        height: 700,
        width: 500,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 400,
            leading: Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 5)),
                TextButton(
                  child: const Text(
                    'Hủy',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 60),
                const Text(
                  'Danh sách mới',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 65),
                TextButton(
                  onPressed: _nameController.text.isEmpty
                      ? null
                      : () {
                    String name = _nameController.text;
                    Color colorDefault = selectedColor ?? Colors.blue;
                    final taskListCollectionViewModel = Provider.of<TaskListCollectionViewModel>(context, listen: false);
                    taskListCollectionViewModel.addTaskList(
                      TaskList(
                        title: name,
                        tasks: [],
                        color: colorDefault,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child:  const Text(
                    'Xong',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedColor ?? Colors.blue,
                            ),
                            child: const Icon(
                              Icons.format_list_bulleted_rounded,
                              color: Colors.white,
                              size: 65,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 320,
                          height: 53,
                          child: TextField(
                            controller: _nameController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Tên danh sách',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: showClearIcon
                                  ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _nameController.clear();
                                    showClearIcon = false;
                                  });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ),
                              )
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 65,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          children: [
                            buildColorContainer(Colors.red),
                            const SizedBox(width: 10),
                            buildColorContainer(Colors.orange),
                            const SizedBox(width: 10),
                            buildColorContainer(Colors.yellow),
                            const SizedBox(width: 10),
                            buildColorContainer(Colors.green),
                            const SizedBox(width: 10),
                            buildColorContainer(Colors.blue),
                            const SizedBox(width: 10),
                            buildColorContainer(Colors.purple),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
