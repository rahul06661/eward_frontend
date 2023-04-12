import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/adminscreens/adminhomepage.dart';
import 'package:eward_frontend/screens/adminscreens/profilescreen.dart';

class adminhomenav extends StatefulWidget {
  const adminhomenav({super.key});

  @override
  State<adminhomenav> createState() => _userhomescreenState();
}

class _userhomescreenState extends State<adminhomenav> {
  int current_st = 0;
  final pages = const [adminHomeScreen(), profile_screen()];
  @override
  

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_st],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'),

              
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Accounts'),
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
