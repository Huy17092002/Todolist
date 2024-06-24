import 'package:flutter/material.dart';
import 'interface/searchbar_widget.dart';
import 'interface/bottom_navigation_bar_widget.dart';
import 'interface/lists_widget.dart';
import 'package:todolist/home/search/searchbarcontroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SearchBarController searchbarcontroller;

  @override
  void initState() {
    super.initState();
    searchbarcontroller = SearchBarController(
      isSearch: false,
      isFix: false,
      opacityFix: 1,
      opacityCancel: 0,
      myController: TextEditingController(),
      focusNode: FocusNode(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 67,
        title: SearchBarWidget(
          paramater: searchbarcontroller,
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
            ListsWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

