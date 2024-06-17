import 'package:flutter/material.dart';


class AppConfigs {
  // App Name
  static const String appName = 'TodoListApp';

  // Colors 
  static const Color primaryColor = Colors.blue;
  static const Color appBarBackgroundColor = Colors.white;
  static const Color searchBarColor = Colors.grey;
  static const Color listItemBackgroundColor = Colors.grey;
  static const Color listBorderColor = Colors.black26;
  static const Color iconColor = Colors.blueAccent;
  static const Color trailingIconColor = Colors.grey;
  static const Color textButtonColor = Colors.blue;

  // Text Styles
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 18,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle listTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle hintTextStyle = TextStyle(
    fontSize: 17,
    color: Colors.grey,
  );

  static const TextStyle cancelButtonTextStyle = TextStyle(
    fontSize: 20,
    color: textButtonColor,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle doneButtonTextStyle = TextStyle(
    fontSize: 18,
    color: textButtonColor,
  );

  static const TextStyle appBarMainTitleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );

  static const TextStyle addButtonTextStyle = TextStyle(
    fontSize: 17,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );

  // Icon Sizes
  static const double iconSize = 38;
  static const double trailingIconSize = 17;
  static const double searchBarIconSize = 17;

}