import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class LevelThree extends StatefulWidget {
  @override
  _LevelThreeState createState() => _LevelThreeState();
}

class _LevelThreeState extends State<LevelThree> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    xPos = moveAnimation.value;

    if(xPos > -120){
      biking = true;
      yPos = -88;
    } else {
      biking = false;
      yPos = -50;
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: levelThree,
        )
      ),
      child: Column(
        children: <Widget>[
           !biking?
              Transform.translate
              (
                offset: Offset(-100, 210),
                child: bike
              )
              :
              Transform.translate(offset: Offset(-700,0), child: bike,),
          showLevelThreeArrow ? 
            removeLevelThreeArrow ?
              SlideOutRight(child: levelThreeArrow) : SlideInLeft(child: levelThreeArrow) 
          :
            Transform.translate( offset: Offset(-600, 0), child: levelThreeArrow)
          ,
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state,
          ),
          !biking? SizedBox(height: 0,) : SizedBox( height: 0,),
          Transform.translate(
            offset: Offset(0, -50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BirthdayButton(
                  title: 'Esquer',
                  color: Colors.green,
                  onPressed: (){
                    goLeft();
                  },
                ),
                BirthdayButton(
                  title: 'Parar',
                  color: Colors.red,
                  onPressed: (){
                    stop();
                  },
                ),
                BirthdayButton(
                  title: 'Direita',
                  color: Colors.green,
                  onPressed: (){
                    goRight();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void goRight() {
    moveAnimationController.forward();
    legsAnimationController.repeat();
    direction = Direction.right;
  }

  void stop() {
    moveAnimationController.stop();
    legsAnimationController.stop();
    setState(() {
      direction  == Direction.left ? 
        biking ?
          state = ImageState.leftBiking 
        :
          state = ImageState.stillLeft
      :
        biking ?
          state = ImageState.rightBiking
        :
          state = ImageState.stillRight;
    });
  }

  void goLeft() {
    moveAnimationController.reverse();
    legsAnimationController.repeat();
    direction = Direction.left;
  }

  void startMoving() {
    moveAnimationController = AnimationController(
      duration: Duration(seconds: 6), vsync: this, value: 0.05);
    moveAnimation =
    Tween<double>(begin: -392, end: 440).animate(moveAnimationController)
    ..addListener(() {
      if(moveAnimation.isCompleted){
        Navigator.popAndPushNamed(context, 'level.three');
        moveAnimationController.stop();
        legsAnimationController.stop();
      }
    setState(() {});});
  }

  void startLegs() {
    legsAnimationController = AnimationController(
      duration: Duration(milliseconds: 250), vsync: this);
    legsAnimation =
    Tween<double>(begin: 1, end: 200).animate(legsAnimationController)
    ..addListener(() {
      !biking ?
        direction == Direction.left ?
        (
          legsAnimation.value >= 100 ?  
          state = ImageState.leftRunning1 :
          state = ImageState.leftRunning2
        )
        :
        (
          legsAnimation.value >= 100 ?
          state = ImageState.rightRunning1 :
          state = ImageState.rightRunning2
        )
      :
        direction == Direction.left ?
        (
          legsAnimation.value >= 100 ?  
          state = ImageState.leftBiking1 :
          state = ImageState.leftBiking 
        )
        :
        (
          legsAnimation.value >= 100 ?
          state = ImageState.rightBiking1 :
          state = ImageState.rightBiking
        );
    setState(() {});});
  }

  void startArrow() {
    levelThreeArrowAnimationController = AnimationController(
      duration: Duration(seconds: 5), vsync: this);
    levelThreeArrowAnimation =
    Tween<double>(begin: 0, end: 400).animate(levelThreeArrowAnimationController)
    ..addListener(() {
      if(levelThreeArrowAnimation.value >= 200){
        showLevelThreeArrow = true;
      }
    
      if(levelThreeArrowAnimation.isCompleted){
        removeLevelThreeArrow = true;
      }
    setState(() {});});
  }

  @override
  initState(){
    super.initState();
    Rute.folder = 'x2';
    yPos = 0;
    startMoving();
    startLegs();
    startArrow();
    levelThreeArrowAnimationController.forward();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    levelThreeArrowAnimationController.dispose();
    moveAnimationController.stop();
    legsAnimationController.stop();
    super.dispose();
  }
}