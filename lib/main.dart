import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/auth_screen.dart';
import 'package:flutterdemo/screens/home_screen.dart';
import 'package:flutterdemo/screens/form_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.red),
    initialRoute: "/",
    routes: {
      '/': (context) => HomeScreen(),
      '/form': (context) => FormScreen(),
      '/auth': (context) => AuthScreen(),
    },
  ));
}
