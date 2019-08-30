import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page')
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.assignment_return),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}