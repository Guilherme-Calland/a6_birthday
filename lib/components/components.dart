import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';

enum Direction
{
  left, right 
}

enum ImageState
{
  stillLeft, stillRight, legUp1Left, legUp2Left, legUp1Right, legUp2Right, openDoor, arrowOne
}

AnimationController 
  moveAnimationController, 
  jumpAnimationController, 
  legsAnimationController,
  openDoorAnimationController,
  changeScreenDelayAnimationController,
  loadingAnimationController,
  loadingLvl1AnimationController,
  levelOneArrowAnimationController;
Animation 
  moveAnimation, 
  jumpAnimation, 
  legsAnimation,
  openDoorAnimation,
  changeScreenDelayAnimation,
  loadingAnimation,
  loadingLvl1Animation,
  levelOneArrowAnimation;
double xPos = 0, yPos = 0, t = 0, s = 0, v = 0;
Direction direction = Direction.right;
ImageState state = ImageState.stillRight;
bool showOpenDoorButton = false;
bool openingDoorSequence = false;
bool loadingStartScreen = true;
bool loadingLevelOneScreen = true;
bool showLevelOneArrow = false;
bool removeLevelOneArrow = false;
bool running = false;

var livingRoom = AssetImage('images/scenario/livingRoom.png');
var gameMenu = AssetImage('images/scenario/menu4.png');
var ruaJacobina = AssetImage('images/scenario/ruaJacobina.png');
var levelOneArrow = Image.asset('images/scenario/level.one.arrow.png');

final GlobalKey<AnimatorWidgetState> levelOneSlideInKey =
GlobalKey<AnimatorWidgetState>();
final GlobalKey<AnimatorWidgetState> levelOneSlideOutKey =
GlobalKey<AnimatorWidgetState>();