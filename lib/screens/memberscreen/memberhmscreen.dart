import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/memberscreen/notificationview.dart';
import 'package:eward_frontend/screens/memberscreen/complaintview.dart';
import 'package:eward_frontend/screens/memberscreen/account.dart';

class membhomescreen extends StatefulWidget {
  const membhomescreen({super.key});

  @override
  State<membhomescreen> createState() => _userhomescreenState();
}

class _userhomescreenState extends State<membhomescreen> {
  int current_st = 0;
  final pages = const [notificationview(), compscreen(), profile_screen()];
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
              icon: Icon(Icons.supervised_user_circle), label: 'Profile'),
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
