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
    }

    return Transform.translate(
      //inicial posiction
      offset: Offset(xOffset, yOffset),
      child: image
    );
  }
}