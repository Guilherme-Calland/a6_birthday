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
  changeScreenDelayAnimationController;
Animation 
  moveAnimation, 
  jumpAnimation, 
  legsAnimation,
  openDoorAnimation,
  changeScreenDelayAnimation;
double xPos = 0, yPos = 0, t = 0, s = 0, v = 0;
Direction direction = Direction.right;
ImageState state = ImageState.stillRight;
bool showOpenDoorButton = false;
bool openingDoorSequence = false;

var livingRoom = AssetImage('images/livingRoom.png');