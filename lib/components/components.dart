import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';

enum Direction
{
  left, right 
}

enum ImageState
{
  stillLeft, stillRight, 
  legUp1Left, legUp2Left, legUp1Right, legUp2Right, 
  openDoor, arrowOne, arrowTwo, arrowThree,
  leftRunning1, leftRunning2, rightRunning1, rightRunning2,
  rightSwimming, rightSwimming1, rightSwimming2,
  leftSwimming, leftSwimming1, leftSwimming2,
  rightBiking, rightBiking1,
  leftBiking, leftBiking1
}

AnimationController 
  moveAnimationController, 
  jumpAnimationController, 
  legsAnimationController,
  openDoorAnimationController,
  changeScreenDelayAnimationController,
  loadingAnimationController,
  levelOneArrowAnimationController,
  levelTwoArrowAnimationController,
  levelThreeArrowAnimationController,
  loadingLvl1AnimationController,
  loadingLvl2AnimationController,
  loadingLvl3AnimationController;
Animation 
  moveAnimation, 
  jumpAnimation, 
  legsAnimation,
  openDoorAnimation,
  changeScreenDelayAnimation,
  loadingAnimation,
  levelOneArrowAnimation,
  levelTwoArrowAnimation,
  levelThreeArrowAnimation,
  loadingLvl1Animation,
  loadingLvl2Animation,
  loadingLvl3Animation;
double xPos = 0, yPos = 0, t = 0, s = 0, v = 0;
Direction direction = Direction.right;
ImageState state = ImageState.stillRight;
bool showOpenDoorButton = false;
bool openingDoorSequence = false;
bool loadingStartScreen = true;
bool loadingLevelOneScreen = true;
bool loadingLevelTwoScreen = true;
bool loadingLevelThreeScreen = true;
bool showLevelOneArrow = false;
bool showLevelTwoArrow = false;
bool showLevelThreeArrow = false;
bool removeLevelThreeArrow = false;
bool removeLevelOneArrow = false;
bool removeLevelTwoArrow = false;
bool running = false;
bool swimming = false;
bool biking = false;

var livingRoom = AssetImage('images/scenario/livingRoom.png');
var gameMenu = AssetImage('images/scenario/menu4.png');
var ruaJacobina = AssetImage('images/scenario/ruaJacobina.png');
var levelTwo = AssetImage('images/scenario/levelTwo.png');
var levelThree = AssetImage('images/scenario/levelThree.png');
var levelOneArrow = Image.asset('images/scenario/level.one.arrow.png', gaplessPlayback:  true);
var levelTwoArrow = Image.asset('images/scenario/level.two.arrow.png', gaplessPlayback:  true);
var levelThreeArrow = Image.asset('images/scenario/level.three.arrow.png', gaplessPlayback:  true);
var bike = Image.asset('images/rute/x2/bike.png', gaplessPlayback: true,);

final GlobalKey<AnimatorWidgetState> levelOneSlideInKey =
GlobalKey<AnimatorWidgetState>();
final GlobalKey<AnimatorWidgetState> levelOneSlideOutKey =
GlobalKey<AnimatorWidgetState>();