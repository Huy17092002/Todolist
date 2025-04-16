import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';

class ListInfoBottomsheet extends StatefulWidget {
  final TaskList tasklist;

  const ListInfoBottomsheet({
    super.key,
    required this.tasklist,
  });

  @override
  State<ListInfoBottomsheet> createState() => _ListInfoBottomsheetState();
}

class _ListInfoBottomsheetState extends State<ListInfoBottomsheet> {
  Color? selectedColor;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.tasklist.title);
    selectedColor = widget.tasklist.color;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
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
          child: Scaffold(
            appBar: AppBar(
              leading: TextButton(
                child: const Text(
                  'Hủy',
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: const Text(
                'Danh sách thông tin',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              actions: [
                TextButton(
                  child: const Text(
                    'Xong',
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  onPressed: () {
                    widget.tasklist.title = nameController.text;
                    widget.tasklist.color = selectedColor ?? widget.tasklist.color;
                    Provider.of<TaskListCollectionViewModel>(context, listen: false).updateTaskList(widget.tasklist);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: TextField(
                            controller: nameController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Tên danh sách',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: nameController.text.isNotEmpty
                                  ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    nameController.clear();
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

                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all( 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildColorContainer(Colors.red),
                        buildColorContainer(Colors.orange),
                        buildColorContainer(Colors.yellow),
                        buildColorContainer(Colors.green),
                        buildColorContainer(Colors.blue),
                        buildColorContainer(Colors.purple),
                      ],
                    ),
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
