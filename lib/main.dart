import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/home_screen.dart';
import 'package:flutterdemo/screens/form_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.red),
    initialRoute: "/",
    routes: {
      '/': (context) => HomeScreen(),
      '/form': (context) => FormScreen()
    },
  ));
}
