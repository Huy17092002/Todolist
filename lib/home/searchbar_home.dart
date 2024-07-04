import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
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
              child: AnimatedOpacity(
                opacity: opacityFix,
                duration: kDuration,
                curve: Curves.easeOutCirc,
                child: TextButton(
                  child: const Text(
                    'Sửa',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Thank you very much'),
                          actions: [
                            ElevatedButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
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
                          padding: const EdgeInsets.only(bottom: 8.5, right: 4),
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
            if (isSearch)
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: cancel,
                    child: const Text(
                      'Hủy',
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
