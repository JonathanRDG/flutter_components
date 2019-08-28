import 'package:flutter/material.dart';

class HomePageTemp extends StatefulWidget{

  @override
  _HomePageTempState createState() => _HomePageTempState();
}

class _HomePageTempState extends State<HomePageTemp> {

  final options = ['one', 'two','three','four','five','six','seven','eight','nine','then','eleven'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _createItemsShort()
      ),
    );
  }
  List<Widget> _createItems(){

    List<Widget> listd = new List<Widget>();

    for (var opt in options){

      final tempWidget = ListTile(
        title: Text(opt),
      );
      listd..add(tempWidget)
           ..add( Divider() );
    }

    return listd;
  }
  List<Widget> _createItemsShort(){

    var widgets = options.map((item){

      return  Column(
        children: <Widget>[
          ListTile(
            title:Text(item+ '!'),
            subtitle: Text ('hola'),
            leading: Icon(Icons.archive),
            trailing: Icon(Icons.apps),
            onTap: (){

            },
          ),
          Divider(),
        ],
      ) ;

    }).toList();

    return widgets;
  }
}