import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';

enum Direction
{
  left, right 
}

enum ImageState
{
  stillLeft, stillRight, legUp1Left, legUp2Left, legUp1Right, legUp2Right, openDoor, arrowOne, leftRunning1, leftRunning2, rightRunning1, rightRunning2
}

AnimationController 
  moveAnimationController, 
  jumpAnimationController, 
  legsAnimationController,
  openDoorAnimationController,
  changeScreenDelayAnimationController,
  loadingAnimationController,
  loadingLvl1AnimationController,
  levelOneArrowAnimationController,
  loadingLvl2AnimationController;
Animation 
  moveAnimation, 
  jumpAnimation, 
  legsAnimation,
  openDoorAnimation,
  changeScreenDelayAnimation,
  loadingAnimation,
  loadingLvl1Animation,
  levelOneArrowAnimation,
  loadingLvl2Animation;
double xPos = 0, yPos = 0, t = 0, s = 0, v = 0;
Direction direction = Direction.right;
ImageState state = ImageState.stillRight;
bool showOpenDoorButton = false;
bool openingDoorSequence = false;
bool loadingStartScreen = true;
bool loadingLevelOneScreen = true;
bool loadingLevelTwoScreen = true;
bool showLevelOneArrow = false;
bool removeLevelOneArrow = false;
bool running = false;

var livingRoom = AssetImage('images/scenario/livingRoom.png');
var gameMenu = AssetImage('images/scenario/menu4.png');
var ruaJacobina = AssetImage('images/scenario/ruaJacobina.png');
var levelTwo = AssetImage('images/scenario/levelTwo.png');
var levelOneArrow = Image.asset('images/scenario/level.one.arrow.png');

final GlobalKey<AnimatorWidgetState> levelOneSlideInKey =
GlobalKey<AnimatorWidgetState>();
final GlobalKey<AnimatorWidgetState> levelOneSlideOutKey =
GlobalKey<AnimatorWidgetState>();