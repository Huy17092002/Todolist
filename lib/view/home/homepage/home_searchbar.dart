import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/home/homepage/search_task_screen.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  late bool isSearch;
  late bool isFix;
  late double opacityFix;
  late double opacityCancel;
  late TextEditingController myController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    isSearch = false;
    isFix = false;
    opacityFix = 1;
    opacityCancel = 0;
    myController = TextEditingController();
    focusNode = FocusNode();
  }

  void cancel() {
    setState(() {
      isSearch = false;
      isFix = false;
      opacityFix = 1;
      opacityCancel = 0;
    });
    myController.clear();
    focusNode.unfocus();
  }

  void onTapSearch() {
    setState(() {
      isSearch = true;
      isFix = true;
      opacityCancel = 1;
      opacityFix = 0;
    });
  }

  void onSearchChanged(String query) {
    if (query.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              SearchTaskScreen(taskList: TaskList(title: '', tasks: [])),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 303),
          child: GestureDetector(
            onTap: onTapSearch,
            child: AnimatedContainer(
              width: isFix ? 40 : 55,
              height: isFix ? 0 : 33,
              duration: kDuration,
              curve: Curves.easeOutQuad,
              alignment: Alignment.center,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                child: AnimatedContainer(
                  width: isFix ? 305 : 360,
                  height: 35,
                  duration: kDuration,
                  curve: Curves.easeOutQuad,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: focusNode,
                          controller: myController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Tìm kiếm',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 12.5),
                          ),
                          onTap: onTapSearch,
                          onChanged: onSearchChanged,
                        ),
                      ),
                      if (isSearch)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              myController.clear();
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.5, right: 4),
                            child: Icon(
                              Icons.cancel,
                              color: Colors.grey[500],
                              size: 17,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            if (isSearch)
              Visibility(
                visible: isSearch,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: cancel,
                    child: const Text(
                      'Huỷ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
