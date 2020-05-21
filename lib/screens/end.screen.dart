import 'package:flutter/material.dart';

class EndScreen extends StatefulWidget {
  @override
  _EndScreenState createState() => _EndScreenState();
}



class _EndScreenState extends State<EndScreen> with TickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  String image = 'images/rute/x2/rute.right.png';
  String image1 = 'images/rute/x2/rute.right.png';
  String image2 = 'images/rute/x2/rute.left.png';
  String image3 = 'images/rute/x2/rute.right.legUp1.png';
  String image4 = 'images/rute/x2/rute.left.legUp1png';
  String image5 = 'images/rute/x2/rute.left.running1.png';
  String image6 = 'images/rute/x2/rute.right.running2png';
  String image7 = 'images/rute/x2/rute.biking.left.png';
  String image8 = 'images/rute/x2/rute.left.biking1.png';
  String image9 = 'images/rute/x2/rute.biking.right.png';
  String image10 = 'images/rute/x2/rute.swimming.right.png';
  
  @override
  void initState(){
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          image,
          gaplessPlayback: true,)
        ),
    );
  }
}