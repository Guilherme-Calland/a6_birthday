import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class LevelTwo extends StatefulWidget {
  @override
  _LevelTwoState createState() => _LevelTwoState();
}

class _LevelTwoState extends State<LevelTwo> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    xPos = moveAnimation.value;

    if(xPos > -120){
      swimming = true;
      yPos = 30;
    } else {
      swimming = false;
      yPos = 0;
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: levelTwo,
        )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          showLevelTwoArrow ? 
            removeLevelTwoArrow ?
              SlideOutRight(child: levelTwoArrow) : SlideInLeft(child: levelTwoArrow) 
          :
          Transform.translate(offset: Offset(-600,0), child: levelTwoArrow,)
          ,
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state,
          ),
          SizedBox(height: 65,),
          Row(
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
        swimming ?
          state = ImageState.leftSwimming 
        :
          state = ImageState.stillLeft
      :
        swimming ?
          state = ImageState.rightSwimming
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
      !swimming ?
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
          state = ImageState.leftSwimming1 :
          state = ImageState.leftSwimming2 
        )
        :
        (
          legsAnimation.value >= 100 ?
          state = ImageState.rightSwimming1 :
          state = ImageState.rightSwimming2
        );
    setState(() {});});
  }

  void startArrow() {
    levelTwoArrowAnimationController = AnimationController(
      duration: Duration(seconds: 5), vsync: this);
    levelTwoArrowAnimation =
    Tween<double>(begin: 0, end: 400).animate(levelTwoArrowAnimationController)
    ..addListener(() {
      if(levelTwoArrowAnimation.value >= 100){
        showLevelTwoArrow = true;
      }
    
      if(levelTwoArrowAnimation.isCompleted){
        removeLevelTwoArrow = true;
      }
    setState(() {});});
  }

  @override
  initState(){
    super.initState();
    Rute.folder = 'x2';
    yPos = 0;
    state = ImageState.stillRight;
    startMoving();
    startLegs();
    startArrow();
    levelTwoArrowAnimationController.forward();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loadingLvl2AnimationController.dispose();
    levelTwoArrowAnimationController.dispose();
  }
}