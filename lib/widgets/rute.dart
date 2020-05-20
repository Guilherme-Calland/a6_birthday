import 'package:a6_birthday/components/components.dart';
import 'package:flutter/material.dart';

class Rute extends StatelessWidget {
  static String folder = 'x3';
  double xOffset, yOffset;
  ImageState state;
  Rute({this.xOffset = 0, this.yOffset = 0, this.state = ImageState.stillRight});

  var image;
  var ruteRight = Image.asset('images/rute/$folder/rute.right.png');
  var ruteLeft = Image.asset('images/rute/$folder/rute.left.png');
  var ruteRightLegUp1 = Image.asset('images/rute/$folder/rute.right.legUp1.png');
  var ruteRightLegUp2 = Image.asset('images/rute/$folder/rute.right.legUp2.png');
  var ruteLeftLegUp1 = Image.asset('images/rute/$folder/rute.left.legUp1.png');
  var ruteLeftLegUp2 = Image.asset('images/rute/$folder/rute.left.legUp2.png');
  var ruteLeftOpenDoor = Image.asset('images/rute/$folder/rute.left.openDoor.png');
  var arrowOneImage = Image.asset('images/scenario/level.one.arrow.png');
  var ruteLeftRunning1 = Image.asset('images/rute/$folder/rute.left.running1.png');
  var ruteLeftRunning2 = Image.asset('images/rute/$folder/rute.left.running2.png');
  var ruteRightRunning1 = Image.asset('images/rute/$folder/rute.right.running1.png');
  var ruteRightRunning2 = Image.asset('images/rute/$folder/rute.right.running2.png');
  var ruteRightSwimming = Image.asset('images/rute/$folder/rute.swimming.right.png');
  var ruteRightSwimming1 = Image.asset('images/rute/$folder/rute.swimming.right1.png');
  var ruteRightSwimming2 = Image.asset('images/rute/$folder/rute.swimming.right2.png');
  var ruteLeftSwimming = Image.asset('images/rute/$folder/rute.swimming.left.png');
  var ruteLeftSwimming1 = Image.asset('images/rute/$folder/rute.swimming.left1.png');
  var ruteLeftSwimming2 = Image.asset('images/rute/$folder/rute.swimming.left2.png');


  @override
  Widget build(BuildContext context) {

    if(state == ImageState.stillRight){
      image = ruteRight;
    } else  if(state == ImageState.stillLeft){
      image = ruteLeft;
    } else if(state == ImageState.legUp1Right){
      image = ruteRightLegUp1;
    } else if(state == ImageState.legUp2Right){
      image = ruteRightLegUp2;
    } else if(state  == ImageState.legUp1Left){
      image = ruteLeftLegUp1;
    } else if(state == ImageState.legUp2Left){
      image = ruteLeftLegUp2;
    } else if(state == ImageState.openDoor){
      image = ruteLeftOpenDoor;
    } else if(state == ImageState.arrowOne){
      image = arrowOneImage;
    } else if (state == ImageState.leftSwimming){
      image = ruteLeftSwimming;
    } else if (state == ImageState.leftSwimming1){
      image = ruteLeftSwimming1;
    } else if (state == ImageState.leftSwimming2){
      image = ruteLeftSwimming2;
    } else if (state == ImageState.rightSwimming){
      image = ruteRightSwimming;
    } else if (state == ImageState.rightSwimming1){
      image = ruteRightSwimming1;
    } else if (state == ImageState.rightSwimming2){
      image = ruteRightSwimming2;
    }

    return Transform.translate(
      //inicial posiction
      offset: Offset(xOffset, yOffset),
      child: image
    );
  }
}