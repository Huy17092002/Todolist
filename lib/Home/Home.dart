import 'package:flutter/material.dart';
import 'BottomNavigationBarWidget.dart';
import 'SearchBarWidget.dart';
import 'TaskListWidget.dart';

void main() {
  runApp(
    const MaterialApp(
      home: TodoListApp(),
    ),
  );
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  var myController = TextEditingController();
  bool isSearch = false;
  bool isSua = false;
  double opacitySua = 1;
  double opacityCancel = 0;

  FocusNode focusNode = FocusNode();

  void _cancel() {
    setState(() {
      isSearch = false;
      isSua = false;
      opacitySua = 1;
      opacityCancel = 0;
    });
    myController.clear();
    focusNode.unfocus();
  }

  void _onTapSearch() {
    setState(() {
      isSearch = true;
      isSua = true;
      opacityCancel = 1;
      opacitySua = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 65,
          title: SearchBarWidget(
            isSearch: isSearch,
            isSua: isSua,
            opacityCancel: opacityCancel,
            opacitySua: opacitySua,
            myController: myController,
            focusNode: focusNode,
            onCancel: _cancel,
            onTapSearch: _onTapSearch,
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Danh sách của tôi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TaskListWidget(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
