import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with TickerProviderStateMixin{

  AnimationController moveAnimationController, jumpAnimationController;
  Animation moveAnimation, jumpAnimation;
  double xPos, yPos, t, d, v = 0;

  @override
  Widget build(BuildContext context) {

    xPos = moveAnimation.value;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/livingRoom.png'),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox( height: 130,),
          Rute(xOffset: xPos,),
          SizedBox( height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BirthdayButton(
                title: 'Esquer',
                color: Colors.green,
                onPressed: (){
                  goLeft();
                }
              ),
              BirthdayButton(
                title: 'Parar',
                color: Colors.blue,
                onPressed: (){
                  stop();
                }
              ),
              BirthdayButton(
                title: 'Direita',
                color: Colors.green,
                onPressed: (){
                  goRight();
                }
              ),
            ],
          ),
          BirthdayButton(
            title: 'Pular',
            color: Colors.purple,
            onPressed: (){

            },
          )
        ],
      ),
    );
  }

  void startMoving() {
    moveAnimationController = AnimationController(
      duration: Duration( seconds: 4 ),
      vsync: this,
      value: 0.05
    );
    moveAnimation = Tween<double>(
      begin: -309,
      end: 312
    ).animate(moveAnimationController)
    ..addListener(() {
      setState(() {});
    });
  }

  void goRight() {
    moveAnimationController.forward();
  }

  void stop() {
    moveAnimationController.stop();
  }

  void goLeft() {
    moveAnimationController.reverse();
  }

  @override
  void initState(){
    super.initState();
    startMoving();
    jumpAnimationController = AnimationController(
      duration: Duration( milliseconds: 500 ),
      vsync: this,
      value: 0.00
    );
    jumpAnimation = Tween<double>(
      begin: 0,
      end: 500
    ).animate(jumpAnimationController)
    ..addListener(() {
      setState(() {});
    });

  }


  @override
  void dispose(){
    moveAnimationController.dispose();
    jumpAnimationController.dispose();
    super.dispose();
  }
}

