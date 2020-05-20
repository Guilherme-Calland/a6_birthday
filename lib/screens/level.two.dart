import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';

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
          SizedBox(height: 210,),
          !loadingLevelTwoScreen? 
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
          SizedBox(height: 65,),
          !loadingLevelTwoScreen?
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

  @override
  initState(){
    super.initState();
    Rute.folder = 'x2';
    yPos = 0;
    startLoading();
    loadingLvl2AnimationController.forward();
    startMoving();
    startLegs();
  }

  void startLoading() {
    loadingLvl2AnimationController = AnimationController(
      duration: Duration(seconds: 2), vsync: this, value: 0.00);
    loadingLvl2Animation =
    Tween<double>(begin: 1300, end: 0).animate(loadingLvl2AnimationController)
    ..addListener(() {
      if(loadingLvl2Animation.value > 1200){
        state = ImageState.rightRunning2;
      }else if(loadingLvl2Animation.value > 1100){
        state = ImageState.rightRunning1;
      }else if(loadingLvl2Animation.value > 1000){
        state = ImageState.leftRunning2;
      }else if(loadingLvl2Animation.value > 900){
        state = ImageState.leftRunning1;
      }else if(loadingLvl2Animation.value > 800){
        // state = ImageState.arrowOne;
      } else if(loadingLvl2Animation.value > 700){
        state = ImageState.leftSwimming;
      } else if(loadingLvl2Animation.value > 600){
        state = ImageState.leftSwimming1;
      } else if(loadingLvl2Animation.value > 500){
        state = ImageState.leftSwimming2;
      } else if(loadingLvl2Animation.value > 400){
        state = ImageState.rightSwimming;
      } else if(loadingLvl2Animation.value > 300){
        state = ImageState.rightSwimming1;
      } else if(loadingLvl2Animation.value > 200){
        state = ImageState.rightSwimming2;
      } else if (loadingLvl2Animation.value > 100){
        state = ImageState.stillLeft;
      } else {
        state = ImageState.stillRight;
      }
      if(loadingLvl2Animation.isCompleted){
        loadingLevelTwoScreen = false;
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
}