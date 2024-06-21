import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';

class SearchBarWidget extends StatefulWidget {
  final bool isSearch;
  final bool isSua;
  final double opacitySua;
  final double opacityCancel;
  final TextEditingController myController;
  final FocusNode focusNode;
  final Function() onCancel;
  final Function() onTapSearch;

  const SearchBarWidget({
      required this.isSearch,
      required this.isSua,
      required this.opacityCancel,
      required this.opacitySua,
      required this.focusNode,
      required this.onCancel,
      required this.onTapSearch,
      required this.myController,
      super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
        Padding(
          padding: const EdgeInsets.only(left: 303),
          child: GestureDetector(
            onTap: widget.onTapSearch,
            child: AnimatedContainer(
              width: widget.isSua ? 40 : 55,
              height: widget.isSua ? 0 : 33,
              duration: kDuration,
              curve: Curves.easeOutQuad,
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: widget.opacitySua,
                duration: kDuration,
                curve: Curves.easeOutCirc,
                child:
                TextButton(
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
                width: widget.isSua ? 305 : 360,
                height: 35,
                duration: kDuration,
                curve: Curves.easeOutQuad,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: widget.focusNode,
                        controller: widget.myController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Tìm kiếm',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 12.5),
                        ),
                        onTap: widget.onTapSearch,
                      ),
                    ),
                    if (widget.isSearch)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.myController.clear();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 9, right: 4),
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
            if (widget.isSearch)
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: GestureDetector(
                  onTap: widget.onCancel,
                  child: const Text(
                    'Hủy',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )),
          ],
        )
      ],
    );
  }
}
