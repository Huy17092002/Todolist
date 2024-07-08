import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddListBottomsheet extends StatefulWidget {
  const AddListBottomsheet({super.key});

  @override
  State<AddListBottomsheet> createState() => _AddListBottomsheetState();
}

class _AddListBottomsheetState extends State<AddListBottomsheet> {
  Color? selectedColor;

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
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: SizedBox(
        height: 780,
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
                const SizedBox(
                  width: 60,
                ),
                const Text(
                  'Danh sách mới',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 65),
                TextButton(
                  child: const Text(
                    'Xong',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    CupertinoAlertDialog(
                      title: Text('Title'),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('Discard'),
                          isDestructiveAction: true,
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true).pop('Discard'),
                        ),
                        CupertinoDialogAction(
                          child: Text('Cancel'),
                          isDefaultAction: true,
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true).pop('Cancel'),
                        ),
                      ],);
                  },
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
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
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Tên danh sách',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                            const SizedBox(
                              width: 10,
                            ),
                            buildColorContainer(Colors.orange),
                            const SizedBox(
                              width: 10,
                            ),
                            buildColorContainer(Colors.yellow),
                            const SizedBox(
                              width: 10,
                            ),
                            buildColorContainer(Colors.green),
                            const SizedBox(
                              width: 10,
                            ),
                            buildColorContainer(Colors.blue),
                            const SizedBox(
                              width: 10,
                            ),
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
