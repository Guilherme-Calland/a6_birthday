import 'package:a6_birthday/components/components.dart';
import 'package:flutter/material.dart';

class Rute extends StatelessWidget {
  static String folder = 'x3';
  double xOffset, yOffset;
  ImageState state;
  Rute({this.xOffset = 0, this.yOffset = 0, this.state = ImageState.stillRight});

  var image;
  var ruteRight = Image.asset('images/rute/$folder/rute.right.png', gaplessPlayback: true,);
  var ruteLeft = Image.asset('images/rute/$folder/rute.left.png', gaplessPlayback: true,);
  var ruteRightLegUp1 = Image.asset('images/rute/$folder/rute.right.legUp1.png', gaplessPlayback: true,);
  var ruteRightLegUp2 = Image.asset('images/rute/$folder/rute.right.legUp2.png', gaplessPlayback: true,);
  var ruteLeftLegUp1 = Image.asset('images/rute/$folder/rute.left.legUp1.png', gaplessPlayback: true,);
  var ruteLeftLegUp2 = Image.asset('images/rute/$folder/rute.left.legUp2.png', gaplessPlayback: true,);
  var ruteLeftOpenDoor = Image.asset('images/rute/$folder/rute.left.openDoor.png', gaplessPlayback: true,);
  var arrowOneImage = Image.asset('images/scenario/level.one.arrow.png', gaplessPlayback: true,);
  var arrowTwoImage = Image.asset('images/scenario/level.two.arrow.png', gaplessPlayback: true,);
  var arrowThreeImage = Image.asset('images/scenario/level.three.arrow.png', gaplessPlayback: true,);
  var ruteLeftRunning1 = Image.asset('images/rute/$folder/rute.left.running1.png', gaplessPlayback: true,);
  var ruteLeftRunning2 = Image.asset('images/rute/$folder/rute.left.running2.png', gaplessPlayback: true,);
  var ruteRightRunning1 = Image.asset('images/rute/$folder/rute.right.running1.png', gaplessPlayback: true,);
  var ruteRightRunning2 = Image.asset('images/rute/$folder/rute.right.running2.png', gaplessPlayback: true,);
  var ruteRightSwimming = Image.asset('images/rute/$folder/rute.swimming.right.png', gaplessPlayback: true,);
  var ruteRightSwimming1 = Image.asset('images/rute/$folder/rute.swimming.right1.png', gaplessPlayback: true,);
  var ruteRightSwimming2 = Image.asset('images/rute/$folder/rute.swimming.right2.png', gaplessPlayback: true,);
  var ruteLeftSwimming = Image.asset('images/rute/$folder/rute.swimming.left.png', gaplessPlayback: true,);
  var ruteLeftSwimming1 = Image.asset('images/rute/$folder/rute.swimming.left1.png', gaplessPlayback: true,);
  var ruteLeftSwimming2 = Image.asset('images/rute/$folder/rute.swimming.left2.png', gaplessPlayback: true,);
  var ruteRightBiking = Image.asset('images/rute/$folder/rute.biking.right.png', gaplessPlayback: true,);
  var ruteRightBiking1 = Image.asset('images/rute/$folder/rute.right.biking1.png', gaplessPlayback: true,);
  var ruteLeftBiking = Image.asset('images/rute/$folder/rute.biking.left.png', gaplessPlayback: true,);
  var ruteLeftBiking1 = Image.asset('images/rute/$folder/rute.left.biking1.png', gaplessPlayback: true,);
  var ruteLeftSmiling = Image.asset('images/rute/$folder/rute.left.smiling.png', gaplessPlayback: true,);
  var ruteLeftSmiling1 = Image.asset('images/rute/$folder/rute.left.legUp1.smiling.png', gaplessPlayback: true,);
  var ruteLeftSmiling2 = Image.asset('images/rute/$folder/rute.left.legUp2.smiling.png', gaplessPlayback: true,);
  var ruteRightSmiling1 = Image.asset('images/rute/$folder/rute.right.legUp1.smiling.png', gaplessPlayback: true,);
  var ruteRightSmiling2 = Image.asset('images/rute/$folder/rute.right.legUp2.smiling.png', gaplessPlayback: true,);
  var ruteRightSmiling = Image.asset('images/rute/$folder/rute.right.smiling.png', gaplessPlayback: true,);


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
    } else if (state == ImageState.rightRunning1){
      image = ruteRightRunning1;
    } else if (state == ImageState.rightRunning2){
      image = ruteRightRunning2;
    } else if (state == ImageState.leftRunning1){
      image = ruteLeftRunning1;
    } else if (state == ImageState.leftRunning2){
      image = ruteLeftRunning2;
    } else if (state == ImageState.arrowTwo){
      image = arrowTwoImage;
    } else if (state == ImageState.arrowThree){
      image = arrowThreeImage;
    } else if (state == ImageState.leftRunning1){
      image = ruteLeftRunning1;
    } else if (state == ImageState.leftRunning2){
      image = ruteLeftRunning2;
    } else if (state == ImageState.arrowTwo){
      image = arrowTwoImage;
    } else if (state == ImageState.leftBiking){
      image = ruteLeftBiking;
    } else if (state == ImageState.rightBiking){
      image = ruteRightBiking;
    } else if (state == ImageState.leftBiking1){
      image = ruteLeftBiking1;
    } else if (state == ImageState.rightBiking1){
      image = ruteRightBiking1;
    } else if (state == ImageState.arrowThree){
      image = arrowThreeImage;
    } else if (state == ImageState.leftSmiling){
      image = ruteLeftSmiling;
    } else if (state == ImageState.leftSmiling1){
      image = ruteLeftSmiling1;
    } else if (state == ImageState.leftSmiling2){
      image = ruteLeftSmiling2;
    } else if (state == ImageState.rightSmiling){
      image = ruteRightSmiling;
    } else if (state == ImageState.rightSmiling1){
      image = ruteRightSmiling1;
    } else if (state == ImageState.rightSmiling2){
      image = ruteRightSmiling2;
    }


    return Transform.translate(
      //inicial posiction
      offset: Offset(xOffset, yOffset),
      child: image
    );
  }
}