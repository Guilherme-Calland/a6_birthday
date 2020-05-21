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
      yPos = -28;
    } else {
      biking = false;
      yPos = -50;
    }

    // print(loadingLvl3Animation.value);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: levelThree,
        )
      ),
      child: Column(
        children: <Widget>[
          // SizedBox(height: 10,),
           !biking?
              Transform.translate
              (
                offset: Offset(-100, 210),
                child: bike
              )
              :
              SizedBox(width: 100,),
          showLevelThreeArrow ? 
            removeLevelThreeArrow ?
              SlideOutRight(child: levelThreeArrow) : SlideInLeft(child: levelThreeArrow) 
          :
          Container( height: 198,)
          ,
          !loadingLevelThreeScreen ? 
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state,
          )
          :
          Container(
            height: 52,
            child: Rute(
              xOffset: xPos,
              yOffset: -400,
              state: state,
            ),
          ),
          !biking? SizedBox(height: 28,) : SizedBox(),
          !loadingLevelThreeScreen?
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             
              SizedBox(width: 150,),
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
          : SizedBox()
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

  void startLoading() {
    loadingLvl3AnimationController = AnimationController(
      duration: Duration(seconds: 2), vsync: this, value: 0.00);
    loadingLvl3Animation =
    Tween<double>(begin: 1300, end: 0).animate(loadingLvl3AnimationController)
    ..addListener(() {
      if(loadingLvl3Animation.value > 1200){
        state = ImageState.rightRunning2;
      }else if(loadingLvl3Animation.value > 1100){
        state = ImageState.rightRunning1;
      }else if(loadingLvl3Animation.value > 1000){
        state = ImageState.leftRunning2;
      }else if(loadingLvl3Animation.value > 900){
        state = ImageState.leftRunning1;
      }else if(loadingLvl3Animation.value > 800){
        state = ImageState.arrowThree;
      } else if(loadingLvl3Animation.value > 700){
        state = ImageState.leftBiking;
      } else if(loadingLvl3Animation.value > 600){
        state = ImageState.leftBiking1;
      } else if(loadingLvl3Animation.value > 400){
        state = ImageState.rightBiking;
      } else if(loadingLvl3Animation.value > 300){
        state = ImageState.rightBiking1;
      } else if (loadingLvl3Animation.value > 100){
        state = ImageState.stillLeft;
      } else {
        state = ImageState.stillRight;
      }
      if(loadingLvl3Animation.isCompleted){
        loadingLevelThreeScreen = false;
      }
    setState(() {});});
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
    startLoading();
    loadingLvl3AnimationController.forward();
    startMoving();
    startLegs();
    startArrow();
    levelThreeArrowAnimationController.forward();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loadingLvl3AnimationController.dispose();
    levelThreeArrowAnimationController.dispose();
  }
}