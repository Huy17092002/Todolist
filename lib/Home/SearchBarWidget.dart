import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final bool isSearch;
  final bool isSua;
  final double opacitySua;
  final double opacityCancel;
  final TextEditingController myController;
  final FocusNode focusNode;
  final Function() onCancel;
  final Function() onTapSearch;

  const SearchBarWidget(
      {required this.isSearch,
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
          padding: const EdgeInsets.only(left: 320),
          child: GestureDetector(
            onTap: widget.onTapSearch,
            child: AnimatedContainer(
              width: widget.isSua ? 40 : 40,
              height: widget.isSua ? 0 : 30,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuad,
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: widget.opacitySua,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCirc,
                child: const Text(
                  'Sửa',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
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
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutQuad,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(9),
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
            if (widget.isSearch)
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: GestureDetector(
                  onTap: widget.onCancel,
                  child: const Text(
                    'Hủy',
                    style: TextStyle(
                      fontSize: 20,
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
