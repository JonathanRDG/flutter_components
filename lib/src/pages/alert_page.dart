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
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.assignment_return),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
  void _mostrarAlert(BuildContext context){
    showDialog(
        context:context,
            barrierDismissible: true,
      builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text('Titutlo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Contenido'),
                FlutterLogo(size: 100.0,)
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.00)),
                onPressed:() => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Cancelar'),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.00)),
                onPressed:() => Navigator.of(context).pop(),
              ),
            ],
          );
      }

    );
  }
}