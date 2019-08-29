import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/providers/menu_provider.dart';

    class Homepage extends StatefulWidget{

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
      Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          children: _listItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data) {
    final List<Widget> options = [];
    data.forEach((opt){

      final widgetTemp  = ListTile(
        title: Text(opt['texto']),
        leading: Icon(Icons.border_outer, color: Colors.blue,),
        trailing: Icon(Icons.collections, color: Colors.green),
        onTap: (){},
      );
      options..add(widgetTemp)
              ..add(Divider());
    });

    return options;


  }
    }