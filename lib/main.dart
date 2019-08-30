import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/routes/routes.dart';


    void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: 'Componentes Flutter',
        debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes :getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings){

          print('Ruta llamada ${settings.name}');
          return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage()
          );
        },
      );
    }
  }

