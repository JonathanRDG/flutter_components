import 'dart:math';

import 'package:flutter/material.dart';
class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 10.0;
  double _height = 10.0;
  Color _color = Colors.pink;
  
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color
            ),
      )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.four_k),
        onPressed: (){_changedimentions();

             },
      ),
    );
  }
  void _changedimentions(){

    final random = Random();
  setState(() {
    _width = random.nextInt(100).toDouble();
    _height = random.nextInt(100).toDouble();
    _color = Color.fromRGBO(
       random.nextInt(255),
       random.nextInt(255),
       random.nextInt(255),
       1);
  });
}
}
