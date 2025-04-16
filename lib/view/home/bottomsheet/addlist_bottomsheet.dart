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
          border: selectedColor == color
              ? Border.all(color: Colors.grey, width: 4)
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SizedBox(
        height: 700,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: SizedBox(
            height: 700,
            child: Scaffold(
              appBar: AppBar(
                leadingWidth: 75,
                leading: Row(
                  children: [
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
                  ],
                ),
                title: const Center(
                  child: Text(
                    'Danh sách mới',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: _nameController.text.isEmpty
                        ? null
                        : () {
                            String name = _nameController.text;
                            Color colorDefault = selectedColor ?? Colors.blue;
                            Provider.of<TaskListCollectionViewModel>(context,
                                    listen: false)
                                .addTaskList(
                              TaskList(
                                title: name,
                                tasks: [],
                                color: colorDefault,
                              ),
                            );
                            Navigator.pop(context);
                          },
                    child: const Text(
                      'Xong',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 200,
                        width: double.infinity,
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
                              height: 53,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                              padding:
                                                  EdgeInsets.only(right: 10),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildColorContainer(Colors.red),
                              buildColorContainer(Colors.orange),
                              buildColorContainer(Colors.yellow),
                              buildColorContainer(Colors.green),
                              buildColorContainer(Colors.blue),
                              buildColorContainer(Colors.purple),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
