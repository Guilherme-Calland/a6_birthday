import 'package:a6_birthday/components/components.dart';
import 'package:flutter/material.dart';

class Rute extends StatelessWidget {
  double xOffset, yOffset;
  ImageState state;
  Rute({this.xOffset = 0, this.yOffset = 0, this.state = ImageState.stillRight});

  String imagePath = '';

  @override
  Widget build(BuildContext context) {

    if(state == ImageState.stillRight){
      imagePath = 'rute.right';
    } else  if(state == ImageState.stillLeft){
      imagePath = 'rute.left';
    } else if(state == ImageState.legUp1Right){
      imagePath = 'rute.right.legUp1';
    } else if(state == ImageState.legUp2Right){
      imagePath = 'rute.right.legUp2';
    } else if(state  == ImageState.legUp1Left){
      imagePath = 'rute.left.legUp1';
    } else if(state == ImageState.legUp2Left){
      imagePath = 'rute.left.legUp2';
    } else if(state == ImageState.openDoor){
      imagePath = 'rute.left.openDoor';
    }

    return Transform.translate(
      //inicial posiction
      offset: Offset(xOffset, yOffset),
      child: Image.asset('images/$imagePath.png')
    );
  }
}