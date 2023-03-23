import 'package:flutter/material.dart';

class memberhmescreen extends StatefulWidget {
  const memberhmescreen({super.key});

  @override
  State<memberhmescreen> createState() => _memberhmescreen();
}

class _memberhmescreen extends State<memberhmescreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_notifications_rounded),
              label: "Notifications"),
          BottomNavigationBarItem(
              icon: Icon(Icons.crisis_alert), label: "Complaints"),
          BottomNavigationBarItem(
              icon: Icon(Icons.request_page), label: "Requests"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "Account"),
        ],
        onTap: ((value) {
          setState(() {
            index = value;
          });
        }),
        currentIndex: index,
      ),
    );
  }
}
