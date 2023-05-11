import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/userscreen/notificationview.dart';
import 'package:eward_frontend/screens/userscreen/profilescreen.dart';
import 'package:eward_frontend/screens/userscreen/complaintview.dart';

class userhomescreen extends StatefulWidget {
  const userhomescreen({super.key});

  @override
  State<userhomescreen> createState() => _userhomescreenState();
}

class _userhomescreenState extends State<userhomescreen> {
  int current_st = 0;
  final pages =  [notificationview(), compscreen(), profile_screen()];
  @override
  

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_st],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_notifications_rounded),
              label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.crisis_alert), label: 'Complaints'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: 'Profile')
        ],
        onTap: ((value) {
          setState(() {
            current_st = value;
          });
        }
        ),
        currentIndex: current_st,
      ),
    );
  }
}
