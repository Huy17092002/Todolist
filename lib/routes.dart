import 'package:flutter/material.dart';
import 'package:todolist/tasklistpage/tasklist_page.dart';

import 'homepage/home/home_page.dart';


class Routes {
  static const String home = '/';
  static const String addTask = '/addtask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case addTask:
        return MaterialPageRoute(builder: (_) =>  TaskListPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}