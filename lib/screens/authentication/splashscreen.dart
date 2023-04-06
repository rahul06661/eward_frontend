import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/authentication/loginscreen.dart';
import 'package:eward_frontend/screens/userscreen/chat_screen.dart';

class splash_screen extends StatefulWidget {
  splash_screen({super.key});

  @override
  State<splash_screen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<splash_screen> {
  bool animate = false;

  @override
  void initState() {
    startAnimaion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1500),
                top: animate ? -50 : -100,
                left: animate ? -50 : -100,
                child: const Image(
                  image: AssetImage("assets/images/circle.png"),
                  width: 130,
                  height: 130,
                )),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1500),
                top: 130,
                left: animate ? 0 : -50,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1500),
                  opacity: animate ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("E WARD",
                          style: Theme.of(context).textTheme.headline3),
                      Text(".../ A Digital Step",
                          style: Theme.of(context).textTheme.headline4)
                    ],
                  ),
                )),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1500),
                bottom: animate ? 80 : -150,
                left: 0,
                right: 10,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1500),
                  opacity: animate ? 1 : 0,
                  child: const Image(
                    height: 500,
                    width: 500,
                    image: AssetImage("assets/images/smaple.png"),
                  ),
                )),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1500),
                bottom: animate ? 20 : -60,
                right: 10,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1500),
                  opacity: animate ? 1 : 0,
                  child: const Image(
                    image: AssetImage("assets/images/circle.png"),
                    width: 30,
                    height: 50,
                  ),
                )),
          ],
        ));
  }

  Future startAnimaion() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() => animate = true);
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => loginscreen()));
  }
}
