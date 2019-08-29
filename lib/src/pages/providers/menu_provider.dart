import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
class _MainProvider {

  List<dynamic> options = [];

  _MainProvider(){
    //loadData();
  }

  Future<List<dynamic>>loadData() async{
    final answer = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(answer);
    options = dataMap['rutas'];

    return options;
}
}

final mainprovider = new _MainProvider();