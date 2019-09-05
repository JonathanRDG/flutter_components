import 'dart:async';

import 'package:flutter/material.dart';
class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listNumers = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
       // _add10();
       fetchdata();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body:Stack(
        children: <Widget>[
          _createlist(),
          _createLoading()
        ],
      )

    );
  }

  Widget _createlist() {
    return RefreshIndicator(
      onRefresh: getPage1,
      child: ListView.builder(
        controller: _scrollController,
          itemCount: _listNumers.length,
          itemBuilder: (BuildContext context, int index){

            final imagee = _listNumers[index];

            return FadeInImage(
              image: NetworkImage('https://picsum.photos/200/300/?blur=$imagee'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            );

          }),
    );
  }
  Future<Null> getPage1() async {
    final duration =  Duration(seconds: 2);
    new Timer(duration, (){
      _listNumers.clear();
      _lastItem++;
      _add10();

      return Future.delayed(duration);
    });
  }

  void _add10(){
    for(var i=1;i<10;i++){
      _lastItem++;
      _listNumers.add(_lastItem);
    }

    setState(() {

    });
  }

  Future<Null> fetchdata() async{
    _isLoading = true;
    setState(() {});
      final duration = new Duration(seconds: 2);
      return new Timer(duration, answerHTTP);

  }
  void answerHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 250)
        );

    _add10();
  }

  _createLoading() {
    if(_isLoading)
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );

    else
      return Container();

  }
}
