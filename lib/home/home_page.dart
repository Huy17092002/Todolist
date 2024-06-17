import 'package:flutter/material.dart';
import 'searchbar_widget.dart';
import 'bottom_navigation_bar_widget.dart';
import 'tasklist_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _myController = TextEditingController();
  bool _isSearch = false;
  bool _isSua = false;
  double _opacitySua = 1;
  double _opacityCancel = 0;

  final FocusNode _focusNode = FocusNode();

  void _cancel() {
    setState(() {
      _isSearch = false;
      _isSua = false;
      _opacitySua = 1;
      _opacityCancel = 0;
    });
    _myController.clear();
    _focusNode.unfocus();
  }

  void _onTapSearch() {
    setState(() {
      _isSearch = true;
      _isSua = true;
      _opacityCancel = 1;
      _opacitySua = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        toolbarHeight: 65,
        title: SearchBarWidget(
          isSearch: _isSearch,
          isSua: _isSua,
          opacityCancel: _opacityCancel,
          opacitySua: _opacitySua,
          myController: _myController,
          focusNode: _focusNode,
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
              padding:  EdgeInsets.only(left: 5),
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
    );
  }
}
