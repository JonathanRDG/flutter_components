import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget{
  @override
  _AvatarPageState createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Avatar Page'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(11.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://www.elimparcial.com/__exp'
                    'ort/1565219399365/sites/elimparcial/img/2019/08/07/2576335_'
                    '1.jpg_851672003.jpg'),
              ),
            ),
            Container(
      margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
          child: Text('SL'),
      backgroundColor: Colors.deepPurple,
      ),
            )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://miro.medium.com/max/3200/1*jstBWB-wn8iO02OyqUL2xg.jpeg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      )
    );
  }
}