import 'package:a6_birthday/components/components.dart';
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
          loadingLevelTwoScreen? 
          Rute(
            xOffset: 0,
            yOffset: -400,
            state : state,
          )
          :
          Rute(
            xOffset: xPos,
            yOffset: yPos,
          )
        ],
      ),
    );
  }

  @override
  initState(){
    super.initState();
    Rute.folder = 'x2';
    yPos = 0;
    startLoading();
    loadingLvl2AnimationController.forward();
    startMoving();
  }

  void startLoading() {
    loadingLvl2AnimationController = AnimationController(
      duration: Duration(seconds: 2), vsync: this, value: 0.00);
    loadingLvl2Animation =
    Tween<double>(begin: 1200, end: 0).animate(loadingLvl2AnimationController)
    ..addListener(() {
      if(loadingLvl2Animation.value > 1000){
        state = ImageState.rightRunning2;
      }else if(loadingLvl2Animation.value > 900){
        state = ImageState.rightRunning1;
      }else if(loadingLvl2Animation.value > 800){
        state = ImageState.leftRunning2;
      }else if(loadingLvl2Animation.value > 700){
        state = ImageState.leftRunning1;
      }else if(loadingLvl2Animation.value > 600){
        // state = ImageState.arrowOne;
      } else if(loadingLvl2Animation.value > 500){
        // state = ImageState.legUp1Left;
      } else if(loadingLvl2Animation.value > 400){
        // state = ImageState.legUp2Left;
      } else if (loadingLvl2Animation.value > 300){
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
}