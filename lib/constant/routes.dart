import 'package:flutter/material.dart';
import 'package:todolist/home/home_page.dart';
import 'package:todolist/task/tasklist_page.dart';


class Routes {
  static const String home = '/';
  static const String addTask = '/addtask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case addTask:
        return MaterialPageRoute(builder: (_) => const TaskListPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}