import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/home_page.dart';


    void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext Context){
      return MaterialApp(
        title: 'Componentes Flutter',
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      );
    }
  }

