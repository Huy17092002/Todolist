import 'package:flutter/material.dart';
import 'screen/addtaskscreen_screen.dart';
import 'screen/listscreen_screen.dart';
import 'screen/detailsaddtask_screen.dart';
import 'screen/repeat_screen.dart';

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
          builder: (_) => Scaffold()
        );
    }
  }
}