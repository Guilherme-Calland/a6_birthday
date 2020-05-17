import 'package:a6_birthday/components/direction.dart';
import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  AnimationController moveAnimationController, jumpAnimationController;
  Animation moveAnimation, jumpAnimation;
  double xPos = 0, yPos = 0, t = 0, s = 0, v = 0;
  Direction direction = Direction.right;

  @override
  Widget build(BuildContext context) {
    xPos = moveAnimation.value;
    yPos = -s;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/livingRoom.png'),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 130,
          ),
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            direction: direction
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BirthdayButton(
                  title: 'Esquer',
                  color: Colors.green,
                  onPressed: () {
                    direction = Direction.left;
                    goLeft();
                  }),
              BirthdayButton(
                  title: 'Parar',
                  color: Colors.blue,
                  onPressed: () {
                    stop();
                  }),
              BirthdayButton(
                  title: 'Direita',
                  color: Colors.green,
                  onPressed: () {
                    direction = Direction.right;
                    goRight();
                  }),
            ],
          ),
          BirthdayButton(
            title: 'Pular',
            color: Colors.purple,
            onPressed: () {
              jump();
            },
          )
        ],
      ),
    );
  }



  

  void jump() {
    jumpAnimationController.forward();
  }

  void startMoving() {
    moveAnimationController = AnimationController(
        duration: Duration(seconds: 4), vsync: this, value: 0.05);
    moveAnimation =
    Tween<double>(begin: -309, end: 312).animate(moveAnimationController)
    ..addListener(() {
    setState(() {});});
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
  void initState() {
    super.initState();
    startMoving();
    startJumping();
  }

  void startJumping() {
    jumpAnimationController = AnimationController(
      duration: Duration(milliseconds: 400), vsync: this, value: 0.00
    );
    jumpAnimation =
    Tween<double>(begin: 0, end: 500).animate(jumpAnimationController)
      ..addListener(() {
        double s0 = 0;
        double v0 = 0.5;
        double vf = -0.5;
        double t0 = 0;
        double tf = 500;
        double a = (vf - v0) / (tf - t0);

        t = jumpAnimation.value;
        v = v0 + a * t;
        s = s0 + v0 * t + a * t * t / 2;

        print('value of s: ' + s.toString());
        print('value of t: ' + t.toString());
        print('value of v: ' + v.toString());
        print('');

        if(jumpAnimation.isCompleted){
          jumpAnimationController.reset();
        }

        setState(() {});
      }
    );
  }

  @override
  void dispose() {
    moveAnimationController.dispose();
    jumpAnimationController.dispose();
    super.dispose();
  }
}

