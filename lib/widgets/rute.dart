import 'package:a6_birthday/components/direction.dart';
import 'package:flutter/material.dart';

class Rute extends StatelessWidget {
  double xOffset, yOffset;
  Direction direction;
  Rute({this.xOffset = 0, this.yOffset = 0, this.direction});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      //inicial posiction
      offset: Offset(xOffset, yOffset),
      child: direction == Direction.right ?
      Image.asset('images/rute.right.png') :
      Image.asset('images/rute.left.png'),
    );
  }
}