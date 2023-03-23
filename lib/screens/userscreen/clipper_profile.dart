import 'package:flutter/material.dart';

class clipper_prof extends StatelessWidget {
  const clipper_prof({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        alignment: Alignment.topCenter,
        color: Color.fromRGBO(143, 148, 251, 1),
        height: 200.0,
      ),
      clipper: Myclipper(),
    );
  }
}

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
