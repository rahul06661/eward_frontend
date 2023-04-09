import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class statusbar extends StatelessWidget {
  int states;

  statusbar({super.key, this.states=1});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          Text("Open")
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 2.0,
            decoration: BoxDecoration(
              color: states == 2 || states == 3 ? Colors.green : Colors.red,
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: states == 2 || states == 3 ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          Text("Pending")
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 2.0,
            decoration: BoxDecoration(
              color: states == 3 ? Colors.green : Colors.red,
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: states == 3 ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          Text("Close")
        ],
      ),
    ]);
  }
}
