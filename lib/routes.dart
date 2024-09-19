import 'package:flutter/material.dart';
import 'package:todolist/view/home/homepage/home_page.dart';
import 'package:todolist/view/task/tasklist_page.dart';





class Routes {
  static const String home = '/';
  static const String addTask = '/addtask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case addTask:
        return MaterialPageRoute(builder: (_) =>  const TaskListPage());
      default:
        return MaterialPageRoute(builder: (_) =>  HomePage());
    }
  }
}