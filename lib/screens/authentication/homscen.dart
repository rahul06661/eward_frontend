import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginscreen.dart';

class homescren extends StatelessWidget {
  const homescren({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  signout(context);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
      ),
    );
  }
}

signout(BuildContext context) async {
  final shred = await SharedPreferences.getInstance();
  await shred.clear();

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: ((context) => loginscreen())),
      (route) => false);
}
