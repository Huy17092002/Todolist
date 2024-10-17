import 'package:flutter/material.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/home/homepage/home_page.dart';
import 'package:todolist/view/task/tasklist_page.dart';

class Routes {
  static const String home = '/';
  static const String addTask = '/addtask';
  static const String taskList = '/tasklist';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case addTask:
        return MaterialPageRoute(
          builder: (_) => TaskListPage(
            taskList: TaskList(
              title: 'Default',
              tasks: [],
            ),
          ),
        );
      case taskList:
        final TaskList taskList = settings.arguments as TaskList;
        return MaterialPageRoute(
          builder: (_) => TaskListPage(taskList: taskList),
        );
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}






//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todolist/model/tasklist.dart';
// import 'package:todolist/view/home/homepage/home_page.dart';
// import 'package:todolist/view/task/tasklist_page.dart';
// import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';
// import 'model/tasklist_collection.dart';
//
// class Routes {
//   static const String home = '/';
//   static const String addTask = '/addtask';
//   static const String taskList = '/tasklist';
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case home:
//         return MaterialPageRoute(builder: (_) => HomePage());
//       case addTask:
//         return MaterialPageRoute(
//           builder: (context) => TaskListPage(taskList: TaskList(title: 'Default', tasks: [])),
//         );
//
//       case taskList:
//         final TaskList taskList = settings.arguments as TaskList;
//         return MaterialPageRoute(
//           builder: (_) => TaskListPage(taskList: taskList),
//         );
//       default:
//         return MaterialPageRoute(builder: (context) => const HomePage());
//     }
//   }
// }


//

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todolist/model/tasklist.dart';
// import 'package:todolist/view/home/homepage/home_page.dart';
// import 'package:todolist/view/task/tasklist_page.dart';
// import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';
// import 'model/tasklist_collection.dart';
//
// const initialRoute = '/home';
// const addtaskRoute = '/addtask';
// const taskListRoute = '/tasklist';
//
// var allRoute = {
//   initialRoute: (context) {
//     return Builder(
//       builder: (context) {
//         return MultiProvider(
//           providers: [
//             ChangeNotifierProvider(create: (_) => TaskListCollectionViewModel(data)),
//           ],
//           builder: (context, child) {
//             return HomePage();
//           },
//         );
//       },
//     );
//   },
//   addtaskRoute:(context){
//     return MultiProvider(providers: [
//       ChangeNotifierProvider(create: (_) => TaskListCollectionViewModel(data))
//     ],
//     builder: (context, child){
//       return  TaskListPage(taskList: TaskList(title: '', tasks: []));
//     },
//     );
//   },
//   taskListRoute:(context){
//     return MultiProvider(providers: [
//       ChangeNotifierProvider(create: (_)=> TaskListCollectionViewModel(data))
//     ],
//       builder: (context, child){
//       return TaskListPage(taskList: TaskList(title: '', tasks: []));
//       },
//     );
//   }
//
// };


