import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/homeScreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconSize: WidgetStatePropertyAll(32),
              iconColor: WidgetStatePropertyAll(Colors.white))),
    ),
    home: HomeScreen(),
  ));
}
