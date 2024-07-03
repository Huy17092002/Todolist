import 'package:flutter/material.dart';
import 'package:todolist/configs.dart';
import 'package:todolist/home/search/searchbarcontroller.dart';

class SearchBarWidget extends StatefulWidget {
  final SearchBarController paramater;

  const SearchBarWidget({
    required this.paramater,
    super.key,
  });

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
            onTap: () {
              setState(() {
                widget.paramater.onTapSearch();
              });
            },
            child: AnimatedContainer(
              width: widget.paramater.isFix ? 40 : 55,
              height: widget.paramater.isFix ? 0 : 33,
              duration: kDuration,
              curve: Curves.easeOutQuad,
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: widget.paramater.opacityFix,
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
                width: widget.paramater.isFix ? 305 : 360,
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
                        focusNode: widget.paramater.focusNode,
                        controller: widget.paramater.myController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Tìm kiếm',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 12.5),
                        ),
                        onTap: () {
                          setState(() {
                            widget.paramater.onTapSearch();
                          });
                        },
                      ),
                    ),
                    if (widget.paramater.isSearch)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.paramater.myController.clear();
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
            if (widget.paramater.isSearch)
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.paramater.cancel();
                      });
                    },
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        fontSize: 18,
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
