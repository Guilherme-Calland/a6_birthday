import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

enum Direction
{
  left, right 
}

enum ImageState
{
  stillLeft, stillRight, legUp1Left, legUp2Left, legUp1Right, legUp2Right, openDoor
}

AnimationController 
  moveAnimationController, 
  jumpAnimationController, 
  legsAnimationController,
  openDoorAnimationController,
  changeScreenDelayAnimationController,
  loadingAnimationController;
Animation 
  moveAnimation, 
  jumpAnimation, 
  legsAnimation,
  openDoorAnimation,
  changeScreenDelayAnimation,
  loadingAnimation;
double xPos = 0, yPos = 0, t = 0, s = 0, v = 0;
Direction direction = Direction.right;
ImageState state = ImageState.stillRight;
bool showOpenDoorButton = false;
bool openingDoorSequence = false;

var livingRoom = AssetImage('images/scenario/livingRoom.png');
var gameMenu = AssetImage('images/scenario/menu4.png');
var ruaJacobina = AssetImage('images/scenario/ruaJacobina.png');