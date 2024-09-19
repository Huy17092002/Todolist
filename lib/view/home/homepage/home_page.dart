import 'package:flutter/material.dart';
import '../../../model/tasklist_collection.dart';
import 'home_bottom_navigationbar.dart';
import 'home_list.dart';
import 'home_searchbar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final TaskListCollection data = TaskListCollection(
    title: 'Danh sach cua toi',
    tasklists: [],
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 67,
        title: const HomeSearchBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 15),
              child: Text(
                widget.data.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: widget.data.color,
                ),
              ),
            ),
            const SizedBox(height: 5),
            HomeList(),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
