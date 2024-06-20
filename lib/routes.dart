import 'package:flutter/material.dart';
import 'package:todolist/home/home_page.dart';
import 'package:todolist/task/addtaskscreen_screen.dart';
import 'package:todolist/task/listscreen_screen.dart';
import 'package:todolist/task/detailsaddtask_screen.dart';
import 'package:todolist/task/repeat_screen.dart';

class Routes {
  static const String home = '/';
  static const String addTask = '/addTask';
  static const String list = '/list';
  static const String detail = '/detail';
  static const String repeat = '/repeat';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case addTask:
        return MaterialPageRoute(builder: (_) => const AddTaskScreen());
      case list:
        return MaterialPageRoute(builder: (_) => const ListScreen());
      case detail:
        return MaterialPageRoute(builder: (_) => const DetailsAddtask());
      case repeat:
        return MaterialPageRoute(builder: (_) => const RepeatScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(),
        );
    }
  }
}
