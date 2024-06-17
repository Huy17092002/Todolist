import 'package:flutter/material.dart';
import 'package:todolist/home/home_page.dart';
import 'task/addtaskscreen_screen.dart';
import 'task/listscreen_screen.dart';
import 'task/detailsaddtask_screen.dart';
import 'task/repeat_screen.dart';

class Routes {
  static const String addTaskScreen = '/addTask';
  static const String listScreen = '/list';
  static const String detailScreen = '/detail';
  static const String repeatScreen = '/repeat';
  static const String homepageScreen = '/homepage';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case addTaskScreen:
        return MaterialPageRoute(builder: (_) => const AddTaskScreen());
      case listScreen:
        return MaterialPageRoute(builder: (_) => const ListScreen());
      case detailScreen:
        return MaterialPageRoute(builder: (_) => const DetailsAddtask());
      case repeatScreen:
        return MaterialPageRoute(builder: (_) => const RepeatScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>const HomePage()
        );
    }
  }
}