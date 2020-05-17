import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with TickerProviderStateMixin{

  AnimationController moveAnimationController;
  Animation moveAnimation;

  @override
  void initState(){
    super.initState();
    moveAnimationController = AnimationController(
      duration: Duration( seconds: 2 ),
      vsync: this,
      value: 0.04
    );
    moveAnimation = Tween<double>(
      begin: -9,
      end: 612
    ).animate(moveAnimationController)
    ..addListener(() {
      setState(() {});
     });
  }

  @override
  Widget build(BuildContext context) {

    double xPos = moveAnimation.value;

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
          Transform.translate(
            offset: Offset(xPos, 0),
            child: Rute()
          ),
          SizedBox( height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BirthdayButton(
                title: 'Esquerda',
                color: Colors.green,
                onPressed: (){
                  moveAnimationController.reverse();
                }
              ),
              BirthdayButton(
                title: 'Pular',
                color: Colors.blue,
                onPressed: (){
                }
              ),
              BirthdayButton(
                title: 'Direita',
                color: Colors.green,
                onPressed: (){
                  moveAnimationController.forward();
                }
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BirthdayButton extends StatelessWidget {

  String title;
  Color color;
  Function onPressed;

  BirthdayButton({this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: RaisedButton(
        padding: EdgeInsets.all(20),
        color: color,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white
          )
        ),
        onPressed: onPressed,
      )
    );
  }
}

class Rute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-300, 0),
      child: Image.asset('images/rute.right.png'),
    );
  }
}