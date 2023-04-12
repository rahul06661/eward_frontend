import 'package:eward_frontend/screens/authentication/splashscreen.dart';
import 'package:flutter/material.dart';

import 'package:eward_frontend/screens/adminscreens/datashow.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: splash_screen(),
    );
  }
}
