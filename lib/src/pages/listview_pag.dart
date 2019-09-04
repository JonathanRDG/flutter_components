import 'package:flutter/material.dart';
class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  List<int> _listNumers = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _createlist(),
    );
  }

  Widget _createlist() {
    return ListView.builder(
        itemCount: _listNumers.length,
        itemBuilder: (BuildContext context, int index){

          final imagee = _listNumers[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/200/300/?blur=$imagee'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );

        });
  }
}
