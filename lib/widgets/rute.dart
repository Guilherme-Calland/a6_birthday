import 'package:flutter/material.dart';

class Rute extends StatelessWidget {
  double xOffset, yOffset;
  Rute({this.xOffset = 0, this.yOffset = 0});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      //inicial posiction
      offset: Offset(xOffset, yOffset),
      child: Image.asset('images/rute.right.png'),
    );
  }
}