import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/Utils/icon_string_util.dart';
//import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/providers/menu_provider.dart';


    class Homepage extends StatefulWidget{

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
      Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.black87,
      title: Text ('Componentes'),
      ),
      body: _list(),
    );

  }

  Widget _list() {
    //print(mainprovider.options);
    return FutureBuilder(
      future: mainprovider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];
    data.forEach((opt){

      final widgetTemp  = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.collections, color: Colors.green),
        onTap: (){
          Navigator.pushNamed(context,opt['ruta']);
          /*final route = MaterialPageRoute(
            builder: (context)=> AlertPage()
          );
          Navigator.push(context, route);*/
        },
      );
      options..add(widgetTemp)
              ..add(Divider());
    });

    return options;


  }
    }