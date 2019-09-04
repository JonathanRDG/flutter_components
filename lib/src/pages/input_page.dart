import 'package:flutter/material.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name='';
  String _email='';
  String _pasword='';
  String _date='';
  String _optionSelected= 'Rayos X' ;

  List<String> _powers = ['Volar', 'Rayos X','Super Aliento','Super Feuerza'];

  TextEditingController _inputController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),

      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPasword(),
          Divider(),
          _createdate(context),
          Divider(),
          _createDropdown(),
          Divider(),
        ],
      ),
    );
  }

 Widget _createInput() {
    return TextField(
     // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Nombre de la persona',
        counter: Text('Letras ${_name.length }'),
        labelText: 'Nombre',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value){

        setState(() {
          _name = value;
        });

      },
    );
  }

  _createEmail() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)
      ),
      onChanged: (value){

        setState(() {
          _email = value;
        });

      },
    );
  }

  _createPasword() {
    return TextField(
      // autofocus: true,
      obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
              hintText: 'Contraseña',
            labelText: 'Contraseña',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)
    ),
    onChanged: (value){

    setState(() {
    _pasword = value;
    });

    },
    );
  }

  _createdate(BuildContext context) {
    return TextField(
      // autofocus: true,
      enableInteractiveSelection: false,
      controller: _inputController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText:  'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async{
    
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );
    if (picked!= null){
      setState(() {
        _date = picked.toString();
        _inputController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown(){
    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach((power){
      list.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });
    return list;


}

  Widget _createDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _optionSelected,
          items:getOptionsDropdown(),
          onChanged: (opt){
            setState(() {
              _optionSelected= opt;
            });
          },
        )
      ],


    );




  }
  
}
